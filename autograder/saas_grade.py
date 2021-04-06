import json
import sys
import re
import os
import requests

base_points = 100

points_re = re.compile('\[(\d+) points\]')

json_data = ''.join(sys.stdin)

loaded_json = json.loads(json_data)
results = loaded_json['examples']
total_points = 0
passed_points = 0
failure = 0
message = []

print('<p>')
for record in results:
  m = points_re.search(record['description'])
  if (m):
    failure += 1
    points = int(m.group(1))
    total_points += points
    if (record['status'] == 'passed'):
      passed_points += points
      print("<h4>%d) %s <span style='color:green'>passed</span></h4>" % (failure, record['full_description']))
    else:
      print("<h4>%d) %s <span style='color:red'>failed</span></h4>" % (failure, record['full_description']))
      print('%s' % (record['exception']['message']))
      print('')

codio_points = int(passed_points * base_points/total_points)      

print("<b><span> Your program got %d out of %d points </span></b>" % (passed_points, total_points))

print('</p>')


url = "{0}&points={1}".format(os.environ['CODIO_PARTIAL_POINTS_URL'], codio_points)
r = requests.get(url)