# duplicates in list

li = {'Tim': 2, 'Test': 3}
li[4] = {'Nested': {'1': 'Life', '2': 'Geeks'}}
s = "Tes"
# rev=li[::-1]

print(li[4]['Nested']['2'])
li.pop(4)
print(li)
li[4] = "ten"
print(li[4])
# print(set(x for x in li if x>7))
