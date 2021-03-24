export type CallbackID = string;

export interface BackgroundTaskPlugin {
  beforeExit(cb: Function): CallbackID;
  finish(options: FinishOptions): void;
}

export interface FinishOptions {
  taskId: CallbackID;
}