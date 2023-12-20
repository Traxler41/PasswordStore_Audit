### [S-] `PasswordStore::setPassword()` has no access controls, meaning it can be accessed by a non-owner.

# Description:
  This function is set to be an 'external' function, however, the natspec and the overall purpose of this smart contract is that "IT ALLOWS ONLY THE OWNER CAN SET PASSWORD".
  This defined function has no access control syntax to restrict non-owners from utilizing this function.

  ```javascript
    function setPassword(string memory newPassword) external
@>    //@audit:- This function has no access controls defined.
    {
        s_password = newPassword;
        emit SetNetPassword();
    }
  ```
# Impact:
  

Proof of Concept:

Recommended Mitigation:
