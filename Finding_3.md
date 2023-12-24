# [I-1]
  The `PasswordStore::getPassword()` function is getPassword() while the natspec says
  it should be `getPassword(string)`

# Impact 
  The natspec is incorrect.

# Recommended Mitigation
  ```diff
  -  *@param newPassword The new password is set.
  ```

