PASSWORD_REQUIREMENTS = /\A
    (?=.{6,}) # At least 6 characters long
    (?=.*\d) # Contain at least one number
    (?=.*[a-z]) # Contain at least one lowercase letter
    (?=.*[[:^alnum:]]) # Contain at least one symbol
  /x
