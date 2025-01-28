(qt-fundamentals)=


# Qt Fundamentals

[Qt](https://www.qt.io/) is an open source, multiplatform toolkit for creating graphical user interfaces (GUIs).
It is a complete development framework that offers utilities for building applications, and has extensions for networking, Bluetooth, charts, 3D rendering, and navigation, among others.

To develop a GUI, we start with the core building blocks—graphical elements known as *widgets*—and arrange them using *layouts*, themselves contained within other widgets and ultimately application *windows*.
Then, we interconnect these widgets using special functions and methods (called *slots*) that are triggered by receiving connected *signals*.
In turn, *actions* are the common building blocks of toolbars and menu items representing a specific option the user can select.



## Basic Qt Components

According to the official [Qt documentation](https://doc.qt.io/qtdesignstudio/quick-components.html): "a component is a reusable building block for a UI".
Qt has some preset components that can include simple representations (shapes, text or images) or complex user interface controls (sliders or dropdowns).
Each type of Qt component is a class starting with the letter ``Q``, followed by the name of the component (such as ``QSlider`` or ``QCombobox``).
Much of Spyder plugin development consists of extending the functionality of its Qt-based graphical interface.

Common Qt components are summarized below in the following sections, and linked to their full reference in the Qt documentation.


### Widgets

[Widgets](https://doc.qt.io/qt/qtwidgets-index.html) are the main building blocks for creating a UI in Qt.
They can display information, receive user input (mouse, keyboard, and other events from the window system), and provide a container for grouping other widgets.

[QWidget](https://doc.qt.io/qt/qwidget.html) is the fundamental class in Qt that provides the capability to handle user input events and renders its representation on the screen.
All UI elements provided by Qt are subclasses of QWidget or are used in connection with a QWidget subclass.
You can define your own custom widgets by creating a QWidget or a suitable subclass, and reimplementing the virtual event handlers.

Top-level widgets have no parent and are an independent window, while child widgets are displayed within its parent widget.
Most widgets in Qt are mainly useful as child widgets.


### MainWindow

The [MainWindow](https://doc.qt.io/qt/qmainwindow.html#details) class provides a main application window with its own layout in which you can include toolbars ([QToolBar](https://doc.qt.io/qt/qtoolbar.html)), menus ([QMenuBar](https://doc.qt.io/qt/qmenubar.html)), status bars ([QStatusBar](https://doc.qt.io/qt/qstatusbar.html)), and dockable widgets ([QDockWidget](https://doc.qt.io/qt/qdockwidget.html)).


### Windows

A [window](https://doc.qt.io/qt/application-windows.html) is a widget that is not embedded in a parent widget.
When an application requires additional windows that do not block the main window, they can be provided as ``QWidget`` instances without a parent.
These can be used for parallel tasks that take place in long-running processes, such as displaying graphs or editing documents.


### Layouts

Qt's [layout](https://doc.qt.io/qt/layout.html) system provides a way to arrange and automatically distribute child widgets, taking advantage of the available space.
It can automatically position and resize widgets when the space available for them changes, ensuring that the UI remains usable.
You can use the built-in layout managers to organize your widgets:

* [QHBoxLayout](https://doc.qt.io/qt/qhboxlayout.html)
* [QVBoxLayout](https://doc.qt.io/qt/qvboxlayout.html)
* [QGridLayout](https://doc.qt.io/qt/qgridlayout.html)
* [QFormLayoutClass](https://doc.qt.io/qt/qformlayout.html), and
* [QStackedLayout](https://doc.qt.io/qt/qstackedlayout.html)


### Actions, Menus & Toolbars

User interfaces of desktop applications often rely on menus and toolbars, for which Qt provides the [QToolBar](https://doc.qt.io/qt/qtoolbar.html#details) and [QMenu](https://doc.qt.io/qt/qmenu.html) classes.
Menus present a list of items to the user when clicked and may be either global or context-specific.
Toolbars display commonly-used controls as a ribbon of buttons (and often other interactive elements).
Since the same individual items can be included multiple places in the UI, items only need to be created once as a [QActions](https://doc.qt.io/qt/qaction.html) that can be added to any menu or toolbar.
Their state will then be automatically synchronized: for example, if the user toggles the "Bold" toolbar button, the "Bold" menu item will also be (un)checked.


### Dialogs

A [dialog](https://doc.qt.io/qt/dialogs.html) is a GUI component used for temporary messages and interactions, such as an error message or configuration panel.
The [QDialog](https://doc.qt.io/qt/qdialog.html) class is used to create dialogs, which can be set as either modal or modeless.
A modal dialog blocks interaction with other windows in the same application until it is dismissed, useful for an error message or requesting key information to complete a requested action.
A modeless dialog behaves as an independent window without blocking the user from doing anything else, such as for a find and replace feature where a user needs to interact with other windows.
Modal dialogs should only be used where truly necessary, as they can harm user productivity and create frustration if a user wants to interact with the rest of the application before dismissing the dialog.

Qt provides some [special dialogs](https://doc.qt.io/qt/dialogs.html) for common use-cases, such as *file open/save*, *font selection*, *error messages*, *color choosing*, *printing*, among others.


### Signals & Slots

GUI programming requires a way to notify and communicate with other objects, which Qt provides via [signals and slots](https://doc.qt.io/qt/signalsandslots.html).

A [Signal](https://doc.qt.io/qt/signalsandslots.html#signals) is a notification emitted by a widget when a particular event occurs.
For example, this might include pressing a button, changing text in an input box, or moving a slider.
Many signals are initiated by an user action, but this is not always the case.
Qt's widgets have different predetermined signals, and you can also add your own.

A [Slot](https://doc.qt.io/qt/signalsandslots.html#slots) is a function that is invoked in response to a specific signal.
Functions and methods can be used as slots by connecting a signal to them.
If a signal sends data, the receiving callable will receive it.
Many Qt widgets also have their own built-in slots, so the corresponding widgets are notified automatically.
You can also add your own slots to manage particular signals that you are interested in.
