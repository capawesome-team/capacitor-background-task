## ⚠️ Deprecated repository

**This project has been moved to the following monorepo: [capawesome-team/capacitor-plugins](https://github.com/capawesome-team/capacitor-plugins).**

-----

<p align="center"><br><img src="https://avatars.githubusercontent.com/u/105555861" width="128" height="128" /></p>
<h3 align="center">Background Task</h3>
<p align="center"><strong><code>@capawesome/capacitor-background-task</code></strong></p>
<p align="center">
  Capacitor plugin for running background tasks. 
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2023?style=flat-square" />
  <a href="https://github.com/capawesome-team/capacitor-background-task/actions?query=workflow%3A%22CI%22"><img src="https://img.shields.io/github/actions/workflow/status/capawesome-team/capacitor-background-task/ci.yml?branch=main&style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capawesome/capacitor-background-task"><img src="https://img.shields.io/npm/l/@capawesome/capacitor-background-task?style=flat-square" /></a>
<br>
  <a href="https://www.npmjs.com/package/@capawesome/capacitor-background-task"><img src="https://img.shields.io/npm/dw/@capawesome/capacitor-background-task?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@capawesome/capacitor-background-task"><img src="https://img.shields.io/npm/v/@capawesome/capacitor-background-task?style=flat-square" /></a>
  <a href="https://github.com/capawesome-team"><img src="https://img.shields.io/badge/part%20of-capawesome-%234f46e5?style=flat-square" /></a>
</p>

## Maintainers

| Maintainer | GitHub                                    | Social                                        |
| ---------- | ----------------------------------------- | --------------------------------------------- |
| Robin Genz | [robingenz](https://github.com/robingenz) | [@robin_genz](https://twitter.com/robin_genz) |

## Sponsors

This is an MIT-licensed open source project. 
It can grow thanks to the support by these awesome people. 
If you'd like to join them, please read more [here](https://github.com/sponsors/capawesome-team).  

<!-- sponsors --><!-- sponsors -->

## Installation

```bash
npm install @capawesome/capacitor-background-task
npx cap sync
```

## Configuration

No configuration required for this plugin.

## Demo

A working example can be found here: [robingenz/capacitor-plugin-demo](https://github.com/robingenz/capacitor-plugin-demo)

## Usage

```typescript
import { App } from '@capacitor/app';
import { BackgroundTask } from '@capawesome/capacitor-background-task';

App.addListener('appStateChange', async ({ isActive }) => {
  if (isActive) {
    return;
  }
  // The app state has been changed to inactive.
  // Start the background task by calling `beforeExit`.
  const taskId = await BackgroundTask.beforeExit(async () => {
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
beforeExit(cb: () => void) => Promise<CallbackID>
```

Call this method when the app moves to the background.
It allows the app to continue running a task in the background.

On **iOS** this method should be finished in less than 30 seconds.

Only available for Android and iOS.

| Param    | Type                       |
| -------- | -------------------------- |
| **`cb`** | <code>() =&gt; void</code> |

**Returns:** <code>Promise&lt;string&gt;</code>

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

On **iOS** the [UIKit framework](https://developer.apple.com/documentation/uikit) is used.
Read more about the implementation and any limitations [here](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background/extending_your_app_s_background_execution_time).

### Android

There is currently no ready implementation on **Android**.
It's planned to add the support in the near future.

## Changelog

See [CHANGELOG.md](https://github.com/capawesome-team/capacitor-background-task/blob/master/CHANGELOG.md).

## License

See [LICENSE](https://github.com/capawesome-team/capacitor-background-task/blob/master/LICENSE).
