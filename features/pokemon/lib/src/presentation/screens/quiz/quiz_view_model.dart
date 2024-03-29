import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:pokemon/assets/assets.gen.dart';
import 'package:pokemon/src/domain/domain.dart';
import 'package:pokemon/src/presentation/base/base.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/answer_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/capture_status.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/choice_dto.dart';
import 'package:pokemon/src/presentation/screens/quiz/dto/question_dto.dart';

class QuizViewModel extends BaseViewModel {
  QuizViewModel(
    this._fetchRandomPokemonUseCase,
    this._generateQuizOptionUseCase,
    this._addToCapturedUseCase,
  );

  final FetchRandomPokemonUseCase _fetchRandomPokemonUseCase;
  final GenerateQuizOptionUseCase _generateQuizOptionUseCase;
  final AddToCapturedUseCase _addToCapturedUseCase;

  AssetsAudioPlayer? _audioPlayer;

  QuestionDTO? _questionDTO;

  AnswerDTO? _answerDTO;

  String? _errorMessage;

  QuestionDTO? get questionDTO => _questionDTO;

  AnswerDTO? get answerDTO => _answerDTO;

  String? get errorMessage => _errorMessage;

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();
  }

  Future<void> onInit() async {
    _audioPlayer = AssetsAudioPlayer.newPlayer();
    await loadPokemon();
  }

  Future<void> loadPokemon() async {
    _questionDTO = null;
    _answerDTO = null;
    _errorMessage = null;
    setLoadingState();

    final eitherPokemon = await _fetchRandomPokemonUseCase();
    eitherPokemon.fold(
      (left) {
        if (left is RandomNullPokemonFailure) {
          _errorMessage =
              'Failed to fetch any pokemon at the moment, please try later';
        } else {
          _errorMessage =
              'Failed to fetch any pokemon at the moment due to: ${left.cause}';
        }
        setErrorState();
      },
      _getQuizOptions,
    );
  }

  Future<void> submitChoice(int index, ChoiceDTO choice) async {
    _answerDTO?.answers[index] = choice;
    notifyListeners();
    await _captureOrEscapedPokemon();
  }

  Future<void> _getQuizOptions(Pokemon pokemon) async {
    final result = await _generateQuizOptionUseCase(pokemon.name);
    result.fold((left) {
      if (left is InvalidNameFailure) {
        _errorMessage = 'Failed to generate options due to invalid name';
      } else {
        _errorMessage = 'Failed to generate options due to: ${left.cause}';
      }
      setErrorState();
    }, (right) async {
      final choices = <ChoiceDTO>[];
      right.forEach((key, value) {
        choices.add(ChoiceDTO(key, value));
      });
      _questionDTO = QuestionDTO(pokemon, choices);
      _answerDTO = AnswerDTO.empty();
      setSuccessState();
      _playAudioFeedback(Assets.audio.appear);
    });
  }

  Future<void> _captureOrEscapedPokemon() async {
    final answerDTO = _answerDTO;
    final questionDTO = _questionDTO;
    if (answerDTO == null || questionDTO == null) return;

    final answers = answerDTO.answers;
    final pokemon = questionDTO.pokemon;
    if (answers.keys.length != pokemon.name.length) {
      _playAudioFeedback(Assets.audio.drag);
      return;
    }

    var sortedAnswers = Map.fromEntries(
      answers.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
    final name = sortedAnswers.values.map((choice) => choice.char).join();
    if (name.toUpperCase() == pokemon.name.toUpperCase()) {
      final isCapturedEither = await _addToCapturedUseCase(pokemon.id);
      isCapturedEither.fold((left) {
        _errorMessage = 'Pokemon escaped due to error: ${left.cause}';
        setErrorState();
      }, (right) async {
        _answerDTO = answerDTO.copyWith(status: CaptureStatus.caught);
        notifyListeners();
        _playAudioFeedback(Assets.audio.gotcha);
      });
    } else {
      _answerDTO = answerDTO.copyWith(status: CaptureStatus.escaped);
      notifyListeners();
      _playAudioFeedback(Assets.audio.flee);
    }
  }

  void _playAudioFeedback(String path) async {
    _audioPlayer?.stop();
    await _audioPlayer?.open(
      Audio(path, package: 'pokemon'),
      showNotification: false,
      autoStart: false,
    );
    _audioPlayer?.play();
  }
}
