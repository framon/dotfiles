#!/usr/bin/python
import argparse
import json
import logging
import signal
import sys
import time
import websocket

logger = logging.getLogger(__name__)


def signal_handler(sig, frame):
    logger.debug('Received signal to stop, exiting')
    sys.stdout.write('\n')
    sys.stdout.flush()
    sys.exit(0)


# Global player state
state = {
    'playState': False,
}

channels = {
    'playState': (lambda x: state.update({'playState': x['payload']})),
    'track': (lambda x: state.update(x['payload'])),
    'shuffle': (lambda x: state.update({'shuffle': x['payload']})),
    'repeat': (lambda x: state.update({'repeat': x['payload']})),
    'time': (lambda x: state.update(x['payload'])),
}


def on_message(ws, message):
    obj = json.loads(message)
    logger.info('Received new metadata:' + obj['channel'])
    clbk = channels.get(obj['channel'], lambda x: logger.error('Unexpected message from GPMDP: ' + x['channel']))
    clbk(obj)
    write_state()


def on_error(ws, error):
    print(error)


def on_close(ws):
    logger.info('Socket Closed')
    write_output(' Disconnected')


def write_state():
    print(state)
    play = state['repeat'] == 'SINGLE_REPEAT' and '' or (state['shuffle'] == 'ALL_SHUFFLE' and '' or '')
    args = [
        state['playState'] and play or '', ' | ',
        state['artist'] or 'No artist', ' | ',
        state['title'] or 'No music'
    ]
    text = ''.join(args)
    write_output(text)

def write_output(text):
    logger.info('Writing output')

    output = {'text': text,
              'class': 'custom-gpmdp',
              'alt': 'Google Play Music Daemon'}

    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()


def parse_arguments():
    parser = argparse.ArgumentParser()

    # Increase verbosity with every occurence of -v
    parser.add_argument('-v', '--verbose', action='count', default=0)

    # Define for which player we're listening
    # parser.add_argument('--player')

    return parser.parse_args()


def main():
    arguments = parse_arguments()

    # Initialize logging
    logging.basicConfig(stream=sys.stderr, level=logging.DEBUG,
                        format='%(name)s %(levelname)s %(message)s')

    # Logging is set by default to WARN and higher.
    # With every occurrence of -v it's lowered by one
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    # Log the sent command line arguments
    logger.debug('Arguments received {}'.format(vars(arguments)))

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    websocket.enableTrace(True)
    ws = websocket.WebSocketApp("ws://localhost:5672/",
                                on_message=on_message,
                                on_error=on_error,
                                on_close=on_close)
    ws.run_forever()


if __name__ == "__main__":
    main()
