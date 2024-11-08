from selenium.webdriver.common.by import By
from robot.api.deco import keyword

from pages.BasePage import BasePage
from lib.enums import LoginMethod


class LoginPage(BasePage):
    
    login_button = (By.XPATH, "//a[@href='/login']")
    login_with_filmweb_button = (By.XPATH, "//button[contains(., 'Kontynuuj z Filmweb')]")
    username_input = (By.NAME, 'login')
    password_input = (By.NAME, 'password')
    submit_button = (By.XPATH, "//button[@type='primary']")
    avatar_img = (By.CSS_SELECTOR, "img.user__avatarImg")
    error_message = (By.XPATH, "//div[contains(text(), 'Nieprawidłowy login lub hasło!')]")

    @keyword
    def click_login_button(self):
        self.click_element(*self.login_button)
    
    @keyword
    def choose_login_method(self, method: LoginMethod):
        if method == LoginMethod.FILMWEB:
            self.click_element(*self.login_with_filmweb_button)

    @keyword
    def enter_username(self, username):
        self.enter_text(*self.username_input, username)

    @keyword
    def enter_password(self, password):
        self.enter_text(*self.password_input, password)

    @keyword
    def submit_login_data(self):
        self.click_element(*self.submit_button)

    @keyword
    def find_avatar(self):
        return self.get_element_with_timeout(*self.avatar_img)
    
    @keyword
    def get_error_message(self):
        return self.get_element_with_timeout(*self.error_message).text
