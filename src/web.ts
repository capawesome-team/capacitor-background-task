import { WebPlugin } from '@capacitor/core';

import type { BackgroundTaskPlugin } from './definitions';

export class BackgroundTaskWeb extends WebPlugin implements BackgroundTaskPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
