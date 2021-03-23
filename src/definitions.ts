export interface BackgroundTaskPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
