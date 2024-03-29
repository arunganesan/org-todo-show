#! /usr/bin/env python

import argparse
import orgparse

"""
Go through the org-mode files

Get the high-pri or medium-pri items

Save to a file
"""

def find_tasks (filename, condition):
    tasks = []
    org = open(filename, 'r').read()
    root = orgparse.loads(org)
    for node in root:
        if condition(node):
            if hasattr(node, 'heading'):
                joined = []
                n = node
                while True:
                    if n.is_root():
                        break
                    joined.insert(0, n.heading)
                    n = n.parent
                
                combined_str = ''
                for ji, j in enumerate(joined):
                    if ji < len(joined) - 1:
                        combined_str += '[' + j + '] '
                    else:
                        combined_str += j

                tasks.append(combined_str)
                #tasks.append(node.heading)
    return tasks

def pri_check (level):
    def func (node, level=level):
        if hasattr(node, 'priority'):
            return node.priority == level
        else:
            return False
    return func

SIDE_PROJ = '/Volumes/Transcend/Dropbox/Orgmode/side-projects.org'
TODO = '/Volumes/Transcend/Dropbox/Orgmode/todo.org'

def today_check (node):
    return 'today' in node.tags

def main():
    todo_tasks = find_tasks(TODO, lambda n: True)
    print '\n'.join(todo_tasks)
    for pri in ['A', 'B', 'C']:
        print '###'
        tasks = find_tasks(SIDE_PROJ, pri_check(pri))
        tasks += find_tasks(TODO, pri_check(pri))
        print '\n'.join(tasks)

    # get "today" tagged items
    print '###'
    side_tasks = find_tasks(SIDE_PROJ, today_check)
    todo_tasks = find_tasks(TODO, today_check)
    tasks = side_tasks + todo_tasks
    print '\n'.join(tasks)

if __name__ == '__main__':
    main()
