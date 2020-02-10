#!/usr/bin/env python
import sys
import re
import json

def main():
    pass

if __name__ == '__main__':
    filename = sys.argv[1]
    regex = '([(\d\.)]+)\t-\t(.*?)\t(\d+)\t\[(.*?)\]\t"(.*?)"\t(\d+)\t(\d+)\t"(.*?)"\t"(.*?)"\t(\d+\.\d{1,3})'
    results = {}

    with open(filename, 'r') as f:
        for line in f:
            match = re.match(regex, line)
            if not match:
                print "Line did not match!"
                print line
                sys.exit(1)

            (
                remote_addr,
                remote_user,
                server_port,
                time_local,
                request,
                status,
                body_bytes_sent,
                http_referer,
                http_user_agent,
                request_time) = match.groups()

            url = request.split(' ')[1]
            url = url.split('?')[0]
            if url not in results:
                results[url] = {}
                results[url]['total_time'] = float(request_time)
                results[url]['max_time'] = float(request_time)
                results[url]['min_time'] = float(request_time)
                results[url]['n'] = 1
            else:
                results[url]['total_time'] += float(request_time)
                results[url]['n'] += 1

                if results[url]['max_time'] < float(request_time):
                    results[url]['max_time'] = float(request_time)

                if results[url]['min_time'] > float(request_time):
                    results[url]['min_time'] = float(request_time)

        print "url,number,total,min,max"
        for key, result in results.iteritems():
            print "{},{},{},{},{}".format(
                            key,
                            result['n'],
                            result['total_time'],
                            result['min_time'],
                            result['max_time'],
                            )
