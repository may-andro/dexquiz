## Table of Contents

- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Adding Components](#adding-components)
- [Hosting](#hosting)

## Getting Started

Storybook is a web app which is used to showcase the different components defined in the design system.

This project has following purpose:
1. Catalog the foundations of the design system.
2. Catalog all the components of the design system.
3. Show case different behaviours and configuration of a components.

The project is based on the flutter package [widgetbook](https://pub.dev/packages/widgetbook). The `widgetbook_generator` mode is used for the development which uses `build_runner` package to generate the necessary code.
For further information please refer to the [doc](https://docs.widgetbook.io/getting-started/setup).

## Project Structure

```
lib/
├ main.dart
├ src
    ├ atoms
    ├ extensions
    ├ foundations
    ├ models
    ├ widgets
```

## Adding Components

1. Add the new component in the corresponding `atoms`, `molecules` and `compounds` folder.
2. Add the `@widgetbook.UseCase` to add the entry in the storybook. For more info refer [here](https://docs.widgetbook.io/getting-started/components).
   Here is an example:
   ```dart
    @widgetbook.UseCase(name: 'Your Widget', type: YourWidget) {
        YourWidget yourWidget(BuildContext context) {
            return const ButtonProgressWidget();
        }
    }  
   ```
3. Once done, use the `melos` command `gen_sb` to generate the code. 
4. Run the `storybook` in chrome using `flutter run`.

## Hosting

The storybook is hosted using the Github pages. You can visit [here](https://may-andro.github.io/dexquiz/) to check it out.