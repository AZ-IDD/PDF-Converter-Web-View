## Features

- **WebView2 Integration**: Embeds a WebView2 control to access the Flip2PDF service for PDF conversions.
- **Silent Installation**: The installer supports silent mode with parameters for tracking affiliates via affid and subid.
- **Custom Installer**: The project includes a custom installer with an icon, desktop shortcuts, and automatic launch after installation.
- **Cross-Platform Deployment**: Utilizes .NET 8.0 for building the application with Windows WPF support.

## Prerequisites

- **.NET 8.0 SDK**: Ensure that .NET 8.0 SDK is installed.
- **WebView2 Runtime**: The application relies on the WebView2 runtime, which is automatically installed if not already present on the system.

## Building the Project

1. Open the `Installer.iss` 
2. Cahnge the paramter `CodeFile` to you file path
3. Cahnge the paramter `ThankYou` to your thank you page link 
4. Run `Installer.iss` 
5. After run `Installer.iss` you can find the install file on `PDFConverterWebView2/Installers`


## Installation

1. Download the installer file from the `PDFConverterWebView2/Installers`
2. Run the installer. (silent installation)
3. The application will automatically launch after installation, or you can start it manually via the desktop shortcut.

## Building the Project

```
PDFConverterWebView2/
│
├── bin/Release/                       # Output folder for compiled binaries
├── Installers/                        # Folder containing the installer
├── Resources/                         # Folder for application icons and other resources
│   └── Logo.ico                       # Icon used for the application
├── App.xaml                           # Application startup XAML definition
├── App.xaml.cs                        # App.xaml C# logic
├── MainWindow.xaml                    # Main application window XAML with WebView2
├── MainWindow.xaml.cs                 # MainWindow logic
├── PDFConverterWebView2.csproj        # Project file
└── Installer.iss                          # Inno Setup script for building the installer
```

## Usage

Once installed, the application launches a window with a web interface for the Flip2PDF service. Users can easily convert their files by navigating to the Flip2PDF site within the embedded WebView2 control.


