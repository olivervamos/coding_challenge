def make_average(list):
    total_value = round(sum(list), 3)
    x = len(list)
    return round(total_value/x, 3)

def report_data(name_1:str, time_user1, list_user1, name_2:str, time_user2, list_user2, name_3:str, time_user3, list_user3):
    average_times = [time_user1, time_user2, time_user3]
    list.sort(average_times)
    dictionary = {list.index(average_times, time_user1): f'{name_1}: {str(time_user1)}s, measured times:{str(list_user1)}', 
                  list.index(average_times, time_user2): f'{name_2}: {str(time_user2)}s, measured times:{str(list_user2)}', 
                  list.index(average_times, time_user3): f'{name_3}: {str(time_user3)}s, measured times:{str(list_user3)}'}
    myKeys = list(dictionary.keys())
    myKeys.sort()
    sorted_dict = {i: dictionary[i] for i in myKeys}
    return sorted_dict

def first_time(dictionary):
    return dictionary[0]

def second_time(dictionary):
    return dictionary[1]

def third_time(dictionary):
    return dictionary[2]