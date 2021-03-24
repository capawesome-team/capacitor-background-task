export type CallbackID = string;

export interface BackgroundTaskPlugin {
  // eslint-disable-next-line @typescript-eslint/ban-types
  beforeExit(cb: Function): CallbackID;
  finish(options: FinishOptions): void;
}

export interface FinishOptions {
  taskId: CallbackID;
}
