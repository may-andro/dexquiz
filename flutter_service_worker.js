'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon-light.png": "1a79d2612fffe4ffd86f797ef81d1ee4",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"main.dart.js": "685840b8a3a0c5e1d37988cf8e6baa28",
"assets/FontManifest.json": "8a3be816d8795267be055c662e111c96",
"assets/AssetManifest.bin": "414311994f95a18cc30a74327b021681",
"assets/fonts/MaterialIcons-Regular.otf": "acd9a5863bdffe25e0f0dc0d52403dc9",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-BlackItalic.ttf": "e9c5c588e39d0765d30bcd6594734102",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-BoldItalic.ttf": "19406f767addf00d2ea82cdc9ab104ce",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraLightItalic.ttf": "a9bed017984a258097841902b696a7a6",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraBoldItalic.ttf": "8afe4dc13b83b66fec0ea671419954cc",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-SemiBoldItalic.ttf": "9841f3d906521f7479a5ba70612aa8c8",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-LightItalic.ttf": "0613c488cf7911af70db821bdd05dfc4",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Italic.ttf": "c1034239929f4651cc17d09ed3a28c69",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-ThinItalic.ttf": "01555d25092b213d2ea3a982123722c9",
"assets/packages/widgetbook/assets/fonts/Poppins/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/packages/widgetbook/assets/logo.png": "445292cbfde4f60d5b3dca36d0d6dfb2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Regular.ttf": "3e1af3ef546b9e6ecef9f3ba197bf7d2",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Thin.ttf": "89e2666c24d37055bcb60e9d2d9f7e35",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Black.ttf": "ec4c9962ba54eb91787aa93d361c10a8",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Light.ttf": "fc84e998bc29b297ea20321e4c90b6ed",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Medium.ttf": "d08840599e05db7345652d3d417574a9",
"assets/packages/alchemist/assets/fonts/Roboto/Roboto-Bold.ttf": "ee7b96fa85d8fdb8c126409326ac2d2b",
"assets/packages/design_system/assets/lottieFiles/pokeball.json": "69ecab3ea8da4f89d8f4302a532c61de",
"assets/packages/design_system/assets/lottieFiles/error.json": "9512db684db5d38d99c46f41d8aa4e40",
"assets/packages/design_system/assets/lottieFiles/kanto.json": "ba6736abb88fa0652f67de11aed3e9b3",
"assets/packages/design_system/assets/lottieFiles/jhoto.json": "b34dfb79696acf1e8b46db77871b7dbf",
"assets/packages/design_system/assets/fonts/Pokemon-Solid.ttf": "36d26dbcd032a9d91d891c9f22dfdec6",
"assets/packages/design_system/assets/images/type_bug.png": "fb10a798873bdff0ccd7f1ad1b008ac7",
"assets/packages/design_system/assets/images/type_ground.png": "51019602f679de02892585cbf5577a19",
"assets/packages/design_system/assets/images/badge_kantodex.png": "1c260b32434b73f64e6a95a4cd891824",
"assets/packages/design_system/assets/images/type_flying.png": "ec8ec843da5de2beea09e98d7bc80e98",
"assets/packages/design_system/assets/images/type_fighting.png": "b3b53cfef3d821e6a42a26b58ccad083",
"assets/packages/design_system/assets/images/badge_dark.png": "006ff327ab8942e96798a8f74668171c",
"assets/packages/design_system/assets/images/type_poison.png": "78299ff60802c05e5f3e17946a8ca40c",
"assets/packages/design_system/assets/images/type_fire.png": "620d7d6795fb349527e7f3670f3634ba",
"assets/packages/design_system/assets/images/type_fairy.png": "194b12e9f720a4a0d47601a98b4926e4",
"assets/packages/design_system/assets/images/badge_ryhorn.png": "ffe343b8166ea87a79a75a1eef393fa8",
"assets/packages/design_system/assets/images/badge_steel.png": "827cb08931b9fc046ca4fc1fed1444d4",
"assets/packages/design_system/assets/images/badge_dragon.png": "6ebed84f8a045b84313b429e69371d7b",
"assets/packages/design_system/assets/images/type_rock.png": "d981912922a8db2501f1ff77c6dfcc85",
"assets/packages/design_system/assets/images/pokemon_master.png": "b385ce9987f8909de4a94466620797fc",
"assets/packages/design_system/assets/images/pokeball.png": "33d146eb32e1c48d46695a347c8d0b4e",
"assets/packages/design_system/assets/images/badge_bug.png": "6ee5d3f78893fdd8b53fc263b6490c10",
"assets/packages/design_system/assets/images/warning.png": "2118692e4cba594ce73a4e176fdb6e7b",
"assets/packages/design_system/assets/images/pokemon_logo.png": "a00ad1fcc56bb4c449538bd2a925e6e6",
"assets/packages/design_system/assets/images/badge_poison.png": "0853ea300f64727b0e7595103509b2e4",
"assets/packages/design_system/assets/images/badge_ghost.png": "e91143a10daaf24adb3eaec39d690b67",
"assets/packages/design_system/assets/images/type_psychic.png": "5a83c6a90150d8f0fcc8818054f4915d",
"assets/packages/design_system/assets/images/type_normal.png": "489bf0925cd320e64840c9416d087a7b",
"assets/packages/design_system/assets/images/type_electric.png": "685693a189f892c953dc6d4a2c95b406",
"assets/packages/design_system/assets/images/badge_water.png": "2cdb951b1b146e3d53dd4bea022aae49",
"assets/packages/design_system/assets/images/type_ice.png": "c2842e5613e210591c1e1a2da5e2e0c1",
"assets/packages/design_system/assets/images/badge_flying.png": "60a473b87e7795a38285bda75aff6250",
"assets/packages/design_system/assets/images/type_dragon.png": "b7f4e0067e33f656d70c0de2fda7d43f",
"assets/packages/design_system/assets/images/badge_magikarp.png": "fb4d41245fa938caa6e4ba855937e387",
"assets/packages/design_system/assets/images/badge_fairy.png": "fdfd1650c12902ad11bdf74063f7f53a",
"assets/packages/design_system/assets/images/type_steel.png": "10e281b83cb9f3b28e8af8e8d9e34ad6",
"assets/packages/design_system/assets/images/type_dark.png": "9a3b71366ffc6d5fdc05df676a8c2b96",
"assets/packages/design_system/assets/images/badge_pokemon.png": "bb0c14e7986230cf356e258454138669",
"assets/packages/design_system/assets/images/pokeball_great.png": "101cd96becab04b0c31aa2cf2c0aa1a2",
"assets/packages/design_system/assets/images/type_grass.png": "e47e57952cfe25249309c66637b776ba",
"assets/packages/design_system/assets/images/badge_victory.png": "ce73960cfc8c7ddb44b16af263e6647a",
"assets/packages/design_system/assets/images/badge_johtodex.png": "1971d42a42e764a0231950eca925a8c8",
"assets/packages/design_system/assets/images/badge_pikachu.png": "e987575357cf7b2967a4e9402e72de64",
"assets/packages/design_system/assets/images/badge_electric.png": "36c326e398d54d11f5505fff11be4f7b",
"assets/packages/design_system/assets/images/pokemon_jhoto.jpeg": "c16e100de8106391ec94c48aca1f0662",
"assets/packages/design_system/assets/images/badge_pokemons.png": "53bdf10472c21ecfafe5093e7aa78683",
"assets/packages/design_system/assets/images/badge_fire.png": "8eed13cce8500d31c96d380a363ab2e5",
"assets/packages/design_system/assets/images/badge_normal.png": "95c7f2e284eb3940821b6b4ce3c9a3a2",
"assets/packages/design_system/assets/images/badge/badge_kantodex.png": "1c260b32434b73f64e6a95a4cd891824",
"assets/packages/design_system/assets/images/badge/badge_ryhorn.png": "ffe343b8166ea87a79a75a1eef393fa8",
"assets/packages/design_system/assets/images/badge/badge_magikarp.png": "fb4d41245fa938caa6e4ba855937e387",
"assets/packages/design_system/assets/images/badge/badge_pokemon.png": "bb0c14e7986230cf356e258454138669",
"assets/packages/design_system/assets/images/badge/badge_victory.png": "ce73960cfc8c7ddb44b16af263e6647a",
"assets/packages/design_system/assets/images/badge/badge_johtodex.png": "1971d42a42e764a0231950eca925a8c8",
"assets/packages/design_system/assets/images/badge/badge_pikachu.png": "e987575357cf7b2967a4e9402e72de64",
"assets/packages/design_system/assets/images/badge/badge_pokemons.png": "53bdf10472c21ecfafe5093e7aa78683",
"assets/packages/design_system/assets/images/badge/badge_lugia.png": "55a833374dac06b3c1654affc229512e",
"assets/packages/design_system/assets/images/type_water.png": "7df80cd832526247fd668a0b6d727f7c",
"assets/packages/design_system/assets/images/type_ghost.png": "49a71f448d65c199f9a5c227558dd4f4",
"assets/packages/design_system/assets/images/badge_psychic.png": "8e5e5ea07aecfb65c8b099e57a487b68",
"assets/packages/design_system/assets/images/badge_fight.png": "dc51549235679cd7b9170c366580f8a4",
"assets/packages/design_system/assets/images/pokeball_ultra.png": "99eb79934ada5c99184cc0923486347a",
"assets/packages/design_system/assets/images/pokeball_premier.png": "4c281b5009472a7e07a3d98980be079e",
"assets/packages/design_system/assets/images/badge_rock.png": "727a1569d4cc61007049b09404703d00",
"assets/packages/design_system/assets/images/badge_ice.png": "f644e420190720f894e140a247481bd1",
"assets/packages/design_system/assets/images/poke_badge.png": "54aaf269c4421377ea7b20ca30a1f3cd",
"assets/packages/design_system/assets/images/badge_lugia.png": "55a833374dac06b3c1654affc229512e",
"assets/packages/design_system/assets/images/badge_grass.png": "3808f5fad9c8cc66ad79b66ba1797c85",
"assets/packages/design_system/assets/gifs/suicune.gif": "12dd72f4156a223173c40c4d9fe861cf",
"assets/packages/design_system/assets/gifs/loading.gif": "a6a7090b9314d56b869bc1b3df72f11d",
"assets/packages/design_system/assets/gifs/intro.gif": "b20c9075bbf5fa145fe90606d24078d4",
"assets/packages/design_system/assets/gifs/eeve.gif": "17d3d7e964ab977b7cced3bcc985909c",
"assets/packages/design_system/assets/gifs/pokemon.gif": "c7e457a6705fc623a476a25bd71d96e4",
"assets/packages/design_system/assets/gifs/error.gif": "19fe5aedcc787eb7f1b1edd4192b835a",
"assets/NOTICES": "4a239a45bb6a10c90449c69c6f4ea600",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.json": "311e8cd871f7205100ad54c2e0d06178",
"assets/AssetManifest.bin.json": "c264b7628058398273657d92f93f2968",
"index.html": "3e2f7131b885834a8a7e6cc5bb0f6499",
"/": "3e2f7131b885834a8a7e6cc5bb0f6499",
"manifest.json": "1dd8205ceca1ecc20484dad604f3ff8a",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon-dark.png": "1a79d2612fffe4ffd86f797ef81d1ee4",
"version.json": "900da94cfb7b9cda8ea5b13dde8225a7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
