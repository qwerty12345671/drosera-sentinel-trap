// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITrap} from "drosera-contracts/interfaces/ITrap.sol";

interface IMockResponse {
    function isActive() external view returns (bool);
}

contract Trap is ITrap {
    // Use the response contract from drosera.toml
    address public constant RESPONSE_CONTRACT = 0x48C396B149b2aF18D1711c8A716Dff627ab251cC;

    // Your Discord nickname for contact/demo
    string constant discordName = "sain"; // Contact Discord nickname

    // Collect trap data
    function collect() external view returns (bytes memory) {
        bool active = IMockResponse(RESPONSE_CONTRACT).isActive();
        return abi.encode(active, discordName);
    }

    // Decide if the trap should respond
    function shouldRespond(bytes[] calldata data) external pure returns (bool, bytes memory) {
        (bool active, string memory name) = abi.decode(data[0], (bool, string));

        // Do not respond if trap inactive or Discord name not set
        if (!active || bytes(name).length == 0) {
            return (false, bytes(""));
        }

        // Respond with the Discord name encoded
        return (true, abi.encode(name));
    }
}
