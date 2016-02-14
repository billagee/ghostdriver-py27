#!/usr/bin/env python

import unittest
from selenium import webdriver

class TestGoogleGhostDriver(unittest.TestCase):
    def setUp(self):
        # The phantomjs executable is assumed to be in your PATH:
        self.driver = webdriver.PhantomJS('phantomjs')
        self.start_url = "http://www.google.com"

    # Simple test that performs a google search
    def testGoogleSearch(self):
        print("Navigating to '{0}'...".format(self.start_url))
        self.driver.get(self.start_url)
        self.assertEqual(u'Google', self.driver.title)
        # Enter text into the search field
        print("Checking search box presence...")
        self.assertTrue(self.driver.find_element_by_name("q").is_displayed())
        print("Performing search request...")
        self.driver.find_element_by_name("q").send_keys("selenium")
        self.driver.find_element_by_name("btnG").click()
        print("current_url is now '{0}'".format(self.driver.current_url))

    def tearDown(self):
        self.driver.quit()

if __name__ == '__main__':
    unittest.main()

