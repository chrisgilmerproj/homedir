#! /usr/local/bin/python
import datetime

def main():
    start = datetime.datetime.now()
    raw_input()
    end = datetime.datetime.now()
    print end - start

if __name__ == "__main__":
    main()
