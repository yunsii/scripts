import consola, { LogLevel } from 'consola'

export function main() {
  consola.level = LogLevel.Verbose
  consola.debug('debug: hello world')
  consola.trace('trace: hello world')

  consola.log('log: hello world')
  consola.info('info: hello world')
  consola.warn('warn: hello world')
  consola.error('error: hello world')
  consola.fatal('fatal: hello world')

  consola.ready('ready: hello world')
  consola.start('start: hello world')
  consola.success('success: hello world')
}
