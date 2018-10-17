#!/bin/bash

INPUT_FILE=""
OUTPUT_FILE=""
BOUNCER=""

collect() {
  while read p; do
    echo "Original URL: $p"
    RESULT=$(curl $BOUNCER -H "Host: $p" -s -o /dev/null -w "$p %{http_code} %{redirect_url}\n")
    echo "Result: $RESULT"
    echo $RESULT >> $OUTPUT_FILE
  done < $INPUT_FILE
}

getOptions(){
  while getopts ":i:o:b:" opt; do
    case $opt in
      i)
        echo "input file specified: $OPTARG" >&2
        INPUT_FILE="$OPTARG"
        ;;
      o)
        echo "output file specified: $OPTARG" >&2
        OUTPUT_FILE="$OPTARG"
        ;;
      b)
        echo "bouncer url specified: $OPTARG" >&2
        BOUNCER="$OPTARG"
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
    esac
  done
}

verifyOptions(){
  if [ "$INPUT_FILE" == "" ]; then
    echo "ERROR: Input file -i was not specified"
  fi

  if [ "$OUTPUT_FILE" == "" ]; then
    echo "ERROR: Output file -o was not specified"
  fi

  if [ "$BOUNCER" == "" ]; then
    echo "ERROR: Bouncer -b was not specified"
  fi
}

main() {
  getOptions $@
  verifyOptions
  collect
}

main $@
