import { WebPlugin } from '@capacitor/core';

import type { BackgroundTaskPlugin, CallbackID, FinishOptions } from './definitions';

export class BackgroundTaskWeb extends WebPlugin implements BackgroundTaskPlugin {
  // eslint-disable-next-line @typescript-eslint/ban-types
  public beforeExit(_cb: Function): CallbackID {
    throw this.unimplemented('Not implemented on web.');
  }

  public finish(_options: FinishOptions): void {
    throw this.unimplemented('Not implemented on web.');
  }
}
