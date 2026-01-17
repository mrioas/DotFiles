import requests as rq
import pprint
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

url_nosecure = "https://172.18.14.45:8443/ords/r/cdla/monitoreo-de-pacientes/emergencia"
url_secure = "https://portal.clinicadelasamericas.com.bo:8443/ords/r/cdla/monitoreo-de-pacientes/emergencia"


class Latency:
    #def __init__(self, s):
    def compare_status(self, oktwohundred):
        try:
            response = rq.get(oktwohundred, verify=False)
            response.raise_for_status()
            return response.status_code
            #print(f"Response Body: {response.json()}")

        except rq.exceptions.RequestException as e:
            print({e})
    def obtain_headers(self, url):
        response = rq.head(url)
        return response


def main():
    x = Latency()
    y = x.compare_status(url_secure)
    z = x.obtain_headers(url_secure)
    if y == 200:
        print("The request is succesfully")
        pprint(z.headers)

if __name__ == "__main__":
    main()