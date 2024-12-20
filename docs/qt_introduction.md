(qt-fundamentals)=


# Qt Fundamentals

[Qt](https://www.qt.io/) is an open source, multiplatform toolkit for creating graphical user interfaces (GUI).
Qt is also a complete development framework that offers utilities for building applications and libraries of extensions for networking, Bluetooth, charts, 3D rendering, navigation, among others.

To develop a GUI, we will add graphical elements of interaction known as widgets and arrange them using layouts.
Then, we interconnect those widgets using customized procedures implemented as functions or methods, allowing to trigger behavior from user interaction.

The following sections describe with more detail some QT components and their main functions.

## Basic Qt Components

According to the official [Qt documentation](https://doc.qt.io/qtdesignstudio/quick-components.html): "a component is a reusable building block for a UI".
Qt has some preset components that can include simple representations (shapes, text or images) or complex user interface (UI) controls (such as sliders).

Each type of Qt component is a class starting with the letter ``Q`` followed by a name related to its functionality.

Spyder's plugin development consists of extending the functionality of its Qt-based graphical interface.

Some of these Qt components are explained below.

### MainWindow ###

``MainWindow`` class provides a main application window and it has its own layout in which you can include toolbars ([QToolBar](https://doc.qt.io/qt-6/qtoolbar.html), menus [QMenuBar](https://doc.qt.io/qt-6/qmenubar.html), status bars [QStatusBar](https://doc.qt.io/qt-6/qstatusbar.html), and dockable widgets [QDockWidgets](https://doc.qt.io/qt-6/qdockwidget.html).

For more details, you can refer to the official Qt documentation [MainWindow](https://doc.qt.io/qt-6/qmainwindow.html#details)

### Windows

A window is a widget that is not embedded in a parent widget.
When an application requires additional windows, which do not block the main window, they can be generated as non-parent ``QWidget`` instances.
These are used for parallel tasks that take place in long-running processes, such as displaying graphs or editing documents.

### Widgets

Widgets are the main elements for creating a UI in Qt.
They can present data and updated information, receive user input (mouse, keyboard, and other events from the window system), and provide a container for grouping other widgets.

``QWidget`` is the fundamental class in Qt that provides the capability to handle user input events and renders its representation on the screen.

All UI elements provided by Qt are subclasses of QWidget or are used in connection with a QWidget subclass.

You can define your own custom widgets by creating a QWidget or a suitable subclass, and reimplement the virtual event handlers.

There are top-level and child widgets.
The first one is a widget without a parent and it is an independent window.
The second one is a non-window widget, which is displayed within its parent widget.
Most widgets in Qt are mainly useful as child widgets.

For more details, you can refer to the official Qt documentation [QWidget](https://doc.qt.io/qt-6/qwidget.html).

### Layouts

Qt layout system provides a way to arrange and distribute automatically child widgets within a widget taking advantage of the available space.
This layout system can automatically position and resize widgets when the space available for them changes, ensuring that the user interface remains usable.
You can use the built-in layout managers to organize your widgets:[QHBoxLayout](https://doc.qt.io/qt-6/qhboxlayout.html), [QVBoxLayout](https://doc.qt.io/qt-6/qvboxlayout.html), [QGridLayout](https://doc.qt.io/qt-6/qgridlayout.html), [QFormLayoutClass](https://doc.qt.io/qt-6/qformlayout.html),and [QStackedLayout](https://doc.qt.io/qt-6/qstackedlayout.html).
For more details, you can refer to the official Qt documentation [Layout Management](https://doc.qt.io/qt-6/layout.html).

### Actions, Toolbars & Menus

User interfaces of desktop applications usually use toolbars and menus.
A toolbar is a GUI element that facilites the acces of functions and controls commonly used in an app.
It can include elements such as buttons, menus, iceons, and search fields.
It is usually located at the top or bottom of a window.
A menu is a GUI element that presents a list of options to a user.
Qt provides the [QToolBar](https://doc.qt.io/qt-6/qtoolbar.html#details) and [QMenu](https://doc.qt.io/qt-6/qmenu.html) classes.
Since QToolBar and QMenu are alternative ways to access the same functionality, Qt provides [QAction](https://doc.qt.io/qt-6/qaction.html) as a way to avoid duplication of functions.
Actions can be added to UI elements such as menus and toolbars, and will automatically keep the UI in sync.
For example, in a word processor, if the user presses a button on the Bold toolbar, the Bold menu item will be automatically checked.

### Dialogs

A *Dialog* is a GUI component that communicates with the user.
Dialogs are commonly used for functions that do not fit into the main interface.
In Qt, by design ``QDialog`` is a modal (or blocking) window that show in front of the main Window until it is dismissed.

Qt provides some *special dialogs* for the most common use-cases as *file Open/Save*, *font selection*, *error messages*, *color choosing*, *printing*, among others.

### Signals & Slots

In the GUI programming is important to provide a way to communicate objects through notifications.
In Qt, signals and slots are used to support this communication.

**Signal** is a notification emitted by a widget when a particular event ocurrs.
Example of these events includes: pressing a button, changing text in an input box, changing text in the window.
Many signals are initiated by an user action, but this is not a rule.
Qt's widgets have different predermined signals, but you can add your own signals to the widgets.

**Slot** is a function that is invoked in response to a specific signal.
<span style="color: red">Functions or methods could be used as slots, by connecting a signal to them.</span>
<span style="color: red">If a signal sends data, the receiver callable will also receive it.</span>
Many Qt widgets also have their own built-in slots, so the corresponding widgets are notified automatically.
Qt's widgets have many pre-defined slots, but it is usual practice to subclass widgets and add your own slots.

For more details, you can refer to the official documentation in the [Signals and slots website](https://doc.qt.io/qt-6/signalsandslots.html)


### Events

An *Event* denote every interaction the user has with a Qt application.
There are several types of events designed to address different types of interactions.
In Qt they are represented by ``QEvent`` instances that contain information about what prompted them, and are passed to specific handlers that are responsible for triggering further actions.
