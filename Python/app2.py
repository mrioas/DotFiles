from selenium import webdriver
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

#driver.get("https://www.selenium.dev/selenium/web/web-form.html")
#chrome_options = Options()
#chrome_options.add_argument("--remote-allow-origins=*")
Options = webdriver.ChromeOptions()
Options.add_experimental_option("useAutomationExtension", False)
Options.add_argument('--ignore-ssl-errors=yes')
Options.add_argument('--ignore-certificate-errors')
#Options.add_argument('--kiosk')
#Options.add_argument('--disable-notifications')
Options.add_argument("force-device-scale-factor=1")
Options.add_argument("high-dpi-support=1")
Options.add_experimental_option("excludeSwitches",["enable-automation"])
#Options.add_experimental_option("profile.password_manager_enabled", False)
#Options.add_experimental_option("credentials_enable_service",False)
prefs = {"credentials_enable_service": False,
         "profile.password_manager_enabled": False}
Options.add_experimental_option("prefs", prefs)
Options.binary_location = '/usr/bin/chromium'
Options.add_argument = '/usr/bin/chomedriver'
#sOptions.add_argument = '--kiosk'
#Options.add_argument("--disable-infobars", True)
Options.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=Options)
driver.delete_all_cookies()
#driver.get("http://127.0.0.1")
#driver.get("https://tasy.clinicadelasamericas.com.bo")
#driver.get("https://portal.clinicadelasamericas.com.bo/ords/r/cdla/monitoreo-de-pacientes")
driver.get("https://172.18.14.45:8443/ords/r/cdla/monitoreo-de-pacientes")
#driver.get("https://fb.com")
driver.implicitly_wait(5)
title = driver.title
print(title)
#user = driver.find_element(By.ID, 'email')
#user = driver.find_element(By.ID, 'loginUsername')
user = driver.find_element(By.ID, 'P9999_USERNAME')
#user.send_keys("60940110")
user.send_keys("monitoreo")
#password = driver.find_element(By.ID, 'loginPassword')
password = driver.find_element(By.ID, 'P9999_PASSWORD')
#password = driver.find_element(By.ID, 'pass')
password.send_keys("monitoreo123*")
#input = driver.find_element(By.CLASS_NAME, 'inputtext')
#enter = driver.find_element(By.TAG_NAME, 'input').click()
#enter = driver.find_element(By.CLASS_NAME, "w-login-button--green").click()
click = driver.find_element(By.CLASS_NAME, "t-Button").click()
click = driver.find_element(By.ID, "t_MenuNav_1").click()
#postc = driver.find_element(By.CLASS_NAME, "dialog_ok_button").click()
#computer = driver.find_element(By., value="CD_MAQUINA")
#computer.send_keys("437")
#time.sleep(2)
#enter_computer = driver.find_element(By.CLASS_NAME, 'gwt-Button').click()
#time.sleep(5)
driver.fullscreen_window()
#print(tag_name)
#driver.close()
