#!/usr/bin/env python

import telnetlib

def get_all_memcached_keys(host='127.0.0.1', port=11211):
    t = telnetlib.Telnet(host, port)
    t.write('stats items STAT items:0:number 0 END\n')
    items = t.read_until('END').split('\r\n')
    keys = set()
    for item in items:
        parts = item.split(':')
        if not len(parts) >= 3:
            continue
        slab = parts[1]
        t.write('stats cachedump {} 200000 ITEM views.decorators.cache.cache_header..cc7d9 [6 b; 1256056128 s] END\n'.format(slab))
        cachelines = t.read_until('END').split('\r\n')
        for line in cachelines:
            parts = line.split(' ')
            if not len(parts) >= 3:
                continue
            keys.add(parts[1])
    t.close()
    return keys

if __name__ == '__main__':
    for line in get_all_memcached_keys():
        print line
