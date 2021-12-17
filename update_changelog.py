#!/usr/bin/env python3

# vf new changelog
# pip3 install python-debian==0.1.39
# pip3 install requests==2.24.0

import re
import sys
from typing import Dict, List

import debian.changelog
import requests
from debian.changelog import Changelog


def read_netxms_changelog(input_lines: List[str]) -> Dict[str, List[str]]:
    changelog: Dict[str, List[str]] = {}
    version = "UNKNOWN"
    for line in input_lines:
        if line == "":
            continue
        if line.strip() == "*":
            continue
        m = re.match(r"^\* ([0-9.]+(-CURRENT)?)", line)
        if m:
            version = m.group(1)
            if version not in changelog:
                v: List[str] = []
                changelog[version] = v
        if line[0] == "-":
            changelog[version].append("  * " + line[2:].strip())
        if line[0] == "\t":
            changelog[version].append("  *   " + line[1:].strip())
    return changelog


version = sys.argv[1]

text = requests.get('https://raw.githubusercontent.com/netxms/changelog/master/ChangeLog').text.splitlines()
new_changes = read_netxms_changelog(text)[version]

with open('changelog', 'r') as f:
    changelog = Changelog(f)

    changelog.new_block(
        package='netxms',
        version=f'{version}-1',
        distributions='stable',
        urgency='medium',
        author="Alex Kirhenshtein <alk@netxms.org>",
        date=debian.changelog.format_date()
    )

    changelog.add_change('')
    for change in new_changes:
        changelog.add_change(change)
    changelog.add_change('')

    # print(changelog)
with open('changelog', 'w') as f:
    changelog.write_to_open_file(f)
