<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>
<h3 align="center">Background Task</h3>
<p align="center"><strong><code>@robingenz/capacitor-background-task</code></strong></p>
<p align="center">
  Capacitor plugin for running background tasks. 
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2021?style=flat-square" />
  <a href="https://github.com/robingenz/capacitor-background-task/actions?query=workflow%3A%22CI%22"><img src="https://img.shields.io/github/workflow/status/robingenz/capacitor-background-task/CI/main?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@robingenz/capacitor-background-task"><img src="https://img.shields.io/npm/l/@robingenz/capacitor-background-task?style=flat-square" /></a>
<br>
  <a href="https://www.npmjs.com/package/@robingenz/capacitor-background-task"><img src="https://img.shields.io/npm/dw/@robingenz/capacitor-background-task?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@robingenz/capacitor-background-task"><img src="https://img.shields.io/npm/v/@robingenz/capacitor-background-task?style=flat-square" /></a>
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<a href="#contributors-"><img src="https://img.shields.io/badge/all%20contributors-1-orange?style=flat-square" /></a>
<!-- ALL-CONTRIBUTORS-BADGE:END -->
</p>

## Maintainers

| Maintainer | GitHub                                    | Social                                        |
| ---------- | ----------------------------------------- | --------------------------------------------- |
| Robin Genz | [robingenz](https://github.com/robingenz) | [@robin_genz](https://twitter.com/robin_genz) |

## Installation

```bash
npm install @robingenz/capacitor-background-task
npx cap sync
```

## Configuration

No configuration required for this plugin.

## Demo

A working example can be found here: [robingenz/capacitor-plugin-demo](https://github.com/robingenz/capacitor-plugin-demo)

## Usage

```typescript
import { App } from '@capacitor/app';
import { BackgroundTask } from '@robingenz/capacitor-background-task';

App.addListener('appStateChange', ({ isActive }) => {
  if (isActive) {
    return;
  }
  // The app state has been changed to inactive.
  // Start the background task by calling `beforeExit`.
  const taskId = BackgroundTask.beforeExit(async () => {
    // Run your code...
    // Finish the background task as soon as everything is done.
    BackgroundTask.finish({ taskId });
  });
});
```

## API

<docgen-index>

* [`beforeExit(...)`](#beforeexit)
* [`finish(...)`](#finish)
* [Interfaces](#interfaces)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### beforeExit(...)

```typescript
beforeExit(cb: () => void) => CallbackID
```

Call this method when the app moves to the background.
It allows the app to continue running a task in the background.

On **iOS** this method should be finished in less than 3 minutes.

Only available for Android and iOS.

| Param    | Type                       |
| -------- | -------------------------- |
| **`cb`** | <code>() =&gt; void</code> |

**Returns:** <code>string</code>

--------------------


### finish(...)

```typescript
finish(options: FinishOptions) => void
```

Finish the current background task.
The OS will put the app to sleep.

Only available for Android and iOS.

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code><a href="#finishoptions">FinishOptions</a></code> |

--------------------


### Interfaces


#### FinishOptions

| Prop         | Type                                              |
| ------------ | ------------------------------------------------- |
| **`taskId`** | <code><a href="#callbackid">CallbackID</a></code> |


### Type Aliases


#### CallbackID

<code>string</code>

</docgen-api>

## Quirks

### iOS

On **iOS** the [BackgroundTasks framework](https://developer.apple.com/documentation/backgroundtasks) is used.
Read more about the implementation and any limitations [here](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background/extending_your_app_s_background_execution_time).

### Android

There is currently no ready implementation on **Android**.
It's planned to add the support in the near future.

## Changelog

See [CHANGELOG.md](https://github.com/robingenz/capacitor-background-task/blob/master/CHANGELOG.md).

## License

See [LICENSE](https://github.com/robingenz/capacitor-background-task/blob/master/LICENSE).
