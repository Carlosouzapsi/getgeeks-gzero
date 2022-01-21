from faker import Faker
fake = Faker()

import bcrypt 

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def factory_user():
    user = {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'pwd123'
    }
    return user

def factory_wrong_email():

    first_name = fake.first_name()

    user = {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': first_name.lower() + '&gmail.com',
        'password': 'pwd123'
    }
    return user

def factory_user_login():
    user = {
        'name': 'Carlos',
        'lastname': 'Souza',
        'email': 'carlos.souza@email.com',
        'password': '123456'
    }
    return user
