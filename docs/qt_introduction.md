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

``QWidget`` is the fundamental class in Qt that provides the capability to handleuser input events and renders its representation on the screen.

All UI elements provided by Qt are subclasses of QWidget or are used in connection with a QWidget subclass.

You can define your own custom widgets by creating a QWidget or a suitable subclass, and reimplement the virtual event handlers.

There are top-level and child widgets.
The first one is a widget without a parent and it is an independent window.
The second one is a non-window widget, which is displayed within its parent widget.
Most widgets in Qt are mainly useful as child widgets.

For more details, you can refer to the official Qt documentation [QWidget](https://doc.qt.io/qt-6/qwidget.html).

### Layouts

Interfaces are built by embedding widgets inside widgets, and since they are visual components they are visually organized by means of *layouts*.
A layout indicates how the widgets fill their container, either as columns, rows, cells in a matrix or stacked so that only one is visible at a time.
Those are the 4 basic layouts available in Qt: ``QHBoxLayout``, ``QVBoxLayout``, ``QGridLayout``, and ``QStackedLayout``.

### Actions, Toolbars & Menus

User interfaces of desktop applications usually use ``QToolbar`` and ``QMenu``.
Since these are alternative ways to access the same functionality, Qt provides ``QAction`` as a way to avoid duplication of functions.
Thus, each time a menu option or a toolbar button gives access to the same function, they point to the same action.


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
