(qt-fundamentals)=


# Qt Fundamentals

[Qt](https://www.qt.io/) is an open source, multiplatform toolkit for creating graphical user interfaces.
Qt is also a complete development framework that offers utilities for building applications and libraries of extensions for networking, Bluetooth, charts, 3D rendering, navigation, among others.

Spyder's plugin development consists of extending the functionality of its Qt-based graphical interface.

To develop a GUI, we will add graphical elements of interaction known as widgets and arrange them using layouts.
Then, we interconnect those widgets using customized procedures implemented as functions or methods, allowing to trigger behavior from user interaction.
The following sections describe with more detail some QT components and their main functions.

## Basic Qt Components

According to the official [Qt documentation](https://doc.qt.io/qtdesignstudio/quick-components.html): "a component is a reusable building block for a UI".
Qt has some preset components that can include simple representations (shapes, text or images) or complex UI controls (such as sliders).

Each type of Qt component is a class starting with the letter ``Q`` followed by a name related to its functionality.

<span style="color: green"> Below, we list some of the Qt components that are related with the plugin development???

### QApplication ###

The core component of Qt is the ``QApplication`` class.
This class manages the GUI application's control flow and main settings.
It is important to know that any GUI application using QT requires to have only one QApplication object. This is applicable no matter how many windows the application has any given time.
Due to the QApplication object is in charge to do different initializations, it must be created before any other objects related to the user interface.

Spyder itself is an instance of ``QApplication``, its starting point is in the following two lines of code (Spyder/Spyder/app/mainwindow.py):

 ```python
 QMainWindow.__init__(self)
 qapp = QApplication.instance()
 ```

<span style="color: red"> Every Qt application needs a single instance of this class as the base, from where the Qt *event loop* is controlled.

QApplication has some responsabilities such as, it:
- Initializes the application with the user's desktop settings.
- Receives events from the underlying window system and transmits them to the applicable widgets.
- Defines the application's appearance.
- Knows the application's windows. For example, you can request which widget is in a specific position using widgetAt().

For more details, you can refer to the official documentation in the [QApplication website](https://doc.qt.io/qt-6/qapplication.html#details).

### QMainWindow ###

``QMainWindow`` class provides a main application window and it has its own layout in which you can include toolbars (<span style="color: green">QToolBars</span>), menus (<span style="color: green">QMenuBar</span>), status bars (<span style="color: green">QStatusBar</span>), and dockable widgets (<span style="color: green">QDockWidgets</span>).

These features serve as the basis for an application.

<span style="color: green">How the QMainWindow is related to the QApplication?</span>

For more details, you can refer to the official documentation in the [QMainWindow website](https://doc.qt.io/qt-6/qmainwindow.html#details)


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

### Widgets

<span style="color: red">In computer science a *Widget* is a shortened form of “window gadget”.</span>
A widget is an element of interaction, such as a button, or a container for other widgets, as panels or tabs.

"Widgets are the primary elements for creating user interfaces in Qt. Widgets can display data and status information, receive user input, and provide a container for other widgets that should be grouped together. A widget that is not embedded in a parent widget is called a window." (https://doc.qt.io/qt-6/qtwidgets-index.html)

The ``QWidget`` class is the fundamental class for creating interfaces in Qt, it receives events from the window system, and renders its representation on the screen.
A widget can provide a container for grouping other widgets, and if it is not embedded in a parent widget, it becomes a window.

"The QWidget class provides the basic capability to render to the screen and to handle user input events. All UI elements that Qt provides are either subclasses of QWidget or are used in connection with a QWidget subclass. To create custom widgets, subclass QWidget or a suitable subclass and reimplement the virtual event handlers."

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


### Windows

If an application requires additional windows that do not block the main window, these are generated as non-parent ``QWidget`` instances.
These are used for tasks that happen in parallel over long-running processes such as displaying graphs or document editing.


### Events

An *Event* denote every interaction the user has with a Qt application.
There are several types of events designed to address different types of interactions.
In Qt they are represented by ``QEvent`` instances that contain information about what prompted them, and are passed to specific handlers that are responsible for triggering further actions.
