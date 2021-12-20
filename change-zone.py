import re
'''
Примеры, на которых проверялось

adding_record_name = 'doc2'
adding_record_type = 'A'
adding_record_value = '192.168.100.255'

adding_record_name = 'doc'
adding_record_type = 'A'
adding_record_value = '192.168.100.255'

adding_record_name = 'doc2'
adding_record_type = 'A'
adding_record_value = '192.168.107.82'

'''

adding_record_name = 'doc2'
adding_record_type = 'A'
adding_record_value = '192.168.107.82'

zone_file = 'example.ru'
adding_record_name = adding_record_name.strip()
adding_record_type = adding_record_type.strip()
adding_record_value = adding_record_value.strip()

adding_record_exist_ip = False
changed_zone_text = ''
zone_records = {}
zone_records_text = ''
records_block_exists = False
max_record_name_length = 0

with open(zone_file) as file:
    for line in file:

        re_cname = re.match(r'(.*)\s+IN\s+CNAME\s+(.*)', line)
        re_a = re.match(r'(.*)\s+IN\s+A\s+(.*)', line)

        if re_cname or re_a:

            if not records_block_exists:
                changed_zone_text += '\n%%%RECORDS_BLOCK%%%\n\n'
                records_block_exists = True

            if re_a:
                record_type = 'A'
                if re_a.group(1)[0:1] == ';':
                    record_name = re_a.group(1)[1:].strip()
                    record_commented = True
                else:
                    record_name = re_a.group(1).strip()
                    record_commented = False

                record_value = re_a.group(2).strip()

            if re_cname:
                record_type = 'CNAME'
                if re_cname.group(1)[0:1] == ';':
                    record_name = re_cname.group(1)[1:].strip()
                    record_commented = True
                else:
                    record_name = re_cname.group(1).strip()
                    record_commented = False

                record_value = re_cname.group(2).strip()

            # Проверяем на существовании в файле записей со значением IP или именем, добавляемой записи
            if record_value == adding_record_value and record_type == adding_record_type:
                print('Для добавляемой записи ' + adding_record_type + ' для значения ' + record_value
                      + ' уже есть есть записть с именем ' + record_name)
                print(record_name + '    IN    ' + record_type + '    ' + record_value)
                print('Заменить (R) или добавить (A) значение для записи с именем ' + record_name + '?')
                while True:
                    input_text = input()
                    if input_text == 'A' or input_text == 'R':
                        break
                if input_text == 'R':
                    record_name = adding_record_value

                adding_record_exist_ip = True

            if not zone_records.get(record_name):
                zone_records[record_name] = []

            if len(record_name) > max_record_name_length:
                max_record_name_length = len(record_name)
            zone_records[record_name].append({
                'type':  record_type,
                'commented': record_commented,
                'value': record_value
            })
        else:
            if line.strip() != '':
                changed_zone_text += line

if adding_record_name in zone_records.keys():
    zone_rec_type = ''
    i = 0
    for zone_rec in zone_records[adding_record_name]:
        if zone_rec['type'] == adding_record_type:

            print('Добавляемая запись ' + adding_record_name + ' c типом ' + adding_record_type + ' уже есть в файле:')
            print(adding_record_name + '    IN    ' + adding_record_type + '    ' + zone_rec['value'])
            print('Заменить (R) или добавить (A) значение для добавляемой записи?')
            while True:
                input_text = input()
                if input_text == 'A' or input_text == 'R':
                    break
            if input_text == 'R':
                zone_records[adding_record_name][i] = {
                    'type': adding_record_type,
                    'commented': False,
                    'value': adding_record_value
                }
            if input_text == 'A':
                zone_records[adding_record_name].append({
                    'type': adding_record_type,
                    'commented': False,
                    'value': adding_record_value
                })
            break
        i += 1
else:
    zone_records[adding_record_name] = [{
        'type': adding_record_type,
        'commented': False,
        'value': adding_record_value
    }]

for key in sorted(zone_records.keys()):
    for record in zone_records[key]:
        if record['commented']:
            key += ';'

        zone_records_text += key.ljust(max_record_name_length + 1) + '    IN    ' + record['type'] + '    ' + record['value'] + '\n'

changed_zone_text.replace('%%%RECORDS_BLOCK%%%', zone_records_text)
print(changed_zone_text.replace('%%%RECORDS_BLOCK%%%', zone_records_text))

