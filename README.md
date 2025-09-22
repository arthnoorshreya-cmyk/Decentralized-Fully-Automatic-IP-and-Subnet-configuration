# Dynamic IP and Subnet Configurator for Highly Mobile Ad Hoc Networks

## Project Overview

This project implements a smart decentralized system for automatically assigning IP addresses and subnet masks to devices in mobile ad hoc networks (MANETs). It addresses the challenges of managing IP configurations in environments where devices move frequently and there is no fixed central server available.

## Key Features

- **Decentralized IP Assignment**: Each device autonomously selects unique IP addresses without relying on a central DHCP server.
- **Dynamic Subnet Configuration**: Subnet masks adjust automatically based on network size and topology changes.
- **Real-time Network Monitoring**: Continuous detection of devices joining or leaving the network.
- **Efficient Communication**: Optimized message passing to minimize bandwidth usage and battery consumption.
- **Fault Tolerance**: Self-healing capabilities when devices fail or lose connection.

## Technology Stack

- **C++17**: For fast, efficient system programming
- **Socket Programming**: For device-to-device communication
- **Distributed Algorithms**: For coordinated addressing without central control
- **CMake**: For cross-platform build management

## Project Structure

```
├── CMakeLists.txt       # Build configuration
├── README.md            # Project documentation
└── src/                 # Source code directory
    ├── network_configurator.h  # Core header file
    ├── network_configurator.cpp # Core implementation
    └── main.cpp         # Main application
```

## Building the Project

### Prerequisites

- CMake 3.10 or higher
- C++17 compatible compiler (GCC 7+, Clang 5+, MSVC 2019+)
- Windows operating system (for Winsock functionality)

### Windows Build Instructions

1. Open Command Prompt or PowerShell
2. Navigate to the project directory
3. Create a build directory:
   ```
   mkdir build
   cd build
   ```
4. Run CMake to generate the build files:
   ```
   cmake ..
   ```
5. Build the project:
   ```
   cmake --build .
   ```

The executable will be generated in the `build/Debug` or `build/Release` directory depending on your build configuration.

## Usage

1. Run the executable:
   ```
   ./dynamic_ip_configurator.exe
   ```

2. Use the menu interface to:
   - View current IP and subnet configuration
   - List all discovered network devices
   - Manually trigger a subnet mask update

3. The application will automatically:
   - Assign a unique IP address to your device
   - Detect other devices in the network
   - Adjust subnet masks as the network changes
   - Handle devices joining or leaving the network

## How It Works

### Decentralized IP Assignment
Each device maintains a local map of used IP addresses by broadcasting "hello" messages and listening for responses. When joining the network, a device selects an IP address that doesn't conflict with any known devices.

### Dynamic Subnet Configuration
The subnet mask is calculated based on the number of active devices in the network. The algorithm aims to provide enough addresses while avoiding excessive waste, with automatic adjustments as the network grows or shrinks.

### Network Monitoring
Devices periodically check the status of other devices and mark them as inactive if they haven't been seen for a configurable timeout period. When devices leave the network, their IP addresses are freed up for reuse.

## Implementation Details

### Core Classes

- `NetworkConfigurator`: Main class that coordinates all components and provides the public API
- `DeviceDiscovery`: Handles detection of other devices in the network
- `SubnetManager`: Manages dynamic calculation and assignment of subnet masks
- `CommunicationManager`: Handles socket-based communication between devices

### Communication Protocol
Devices communicate using UDP messages for broadcasting and point-to-point communication. Key message types include:
- **HELLO**: Broadcast to discover other devices
- **IP_CLAIM**: Announce the use of a specific IP address
- **DEVICE_LEAVING**: Notify other devices when leaving the network

## Limitations and Future Work

### Current Limitations
- The implementation is designed for demonstration purposes and may need further optimization for production use
- The network size is currently limited to a single subnet (future versions will support multiple subnets)
- The device discovery mechanism is simplified for demonstration

### Future Enhancements
- Implement machine learning algorithms to predict network changes and optimize IP assignments
- Add support for multiple subnets and automatic subnet splitting/merging
- Enhance security with authentication and encryption for network communications
- Optimize power consumption for battery-operated devices
- Add support for IPv6 addressing

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.