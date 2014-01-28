def basic_auth(page)
  username = 'chase'
  password = 'chaskins182'
  if page.driver.respond_to?(:basic_auth)
      puts 'Responds to basic_auth'
      page.driver.basic_auth(username, password)
      page
  elsif page.driver.respond_to?(:basic_authorize)
      puts 'Responds to basic_authorize'
      page.driver.basic_authorize(username, password)
      page
  elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      puts 'Responds to browser_basic_authorize'
      page.driver.browser.basic_authorize(username, password)
      page
  else
      raise "I don't know how to log in!"
  end
end
