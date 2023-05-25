// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/// @title IERC721Lockable
/// @dev Interface for the Lockable extension
/// @author streamNFT 

interface IERC721Lockable{
    
    /**
     * @dev Emitted when locker is set for token `id` 
     */
    event SetLocker (uint256 indexed id, address _locker);

    /**
     * @dev Emitted when locker is removed for token `id` 
     */
    event RemoveLocker (uint256 indexed id);

    /**
     * @dev Emitted when `id` token is locked by `locker`
     */
    event Lock (uint256 indexed id);

    /**
     * @dev Emitted when `id` token is unlocked by `locker`
     */
    event Unlock (uint256 indexed id);

    /**
     * @dev Emitted when `id` token is locked by `approved`
     */
    event LockApproved (uint256 indexed id);

    /**
     * @dev Emitted when `id` token is unlocked by `approved`
     */
    event UnlockApproved (uint256 indexed id);


    /**
     * @dev Gives the `_locker` address permission to lock if msg.sender is owner
     */
    function setLocker(uint256 id, address _locker) external;

    /**
     * @dev Purge the permission to lock if `id` is `unlocked` and msg.sender is owner
     */
    function removeLocker(uint256 id) external;

   /**
     * @dev Lock the token `id` if msg.sender is locker
     */
    function lock(uint256 id) external;

    /**
     * @dev Unlocks the token `id` if msg.sender is locker
     */
    function unlock(uint256 id) external;

    /**
     * @dev Lock the token `id` if msg.sender is approved
     */
    function lockApproved(uint256 id) external;

    /**
     * @dev Unlock the token `id` if msg.sender is approved
     */
    function unlockApproved(uint256 id) external;

    /**
     * @dev Returns the wallet, that is stated as unlocking wallet for the `tokenId` token.
     * If address(0) returned, that means token is not locked. Any other result means token is locked.
     */
    function lockerOf(uint256 tokenId) external view returns (address);

}