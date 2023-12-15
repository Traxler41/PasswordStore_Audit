//Audited Code:-

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; //q Is this the correct compiler version

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore {
    // --i maybe use better naming convention
    error PasswordStore__NotOwner();


    //***STATE VARIABLES***

    address private s_owner; //Owner of this contract who sets and retrieves password.
    string private s_password;//@audit-the variable s_password is not actually private. This is not a secure way to store password. Private on-chain data are not actually private.

    //***EVENTS***

    event SetNetPassword();

    constructor() {
        s_owner = msg.sender;
    }

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */

    //q Can a non-owner set a password?---YES.
    //@audit-Any user can set password. 
    //Missing Access Control.
    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     //@audit- No parameter is to be passed.
     * @param newPassword The new password to set.
     */
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}
