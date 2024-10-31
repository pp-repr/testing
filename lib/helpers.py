import time
import random
from functools import wraps

def wait_random_after_operation(secs_from=1.5, sec_to=3):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            ret = func(*args, **kwargs)
            time.sleep(random.uniform(secs_from, sec_to))
            return ret
        return wrapper
    return decorator
