
Changelog - 4.x.x Releases
==========================

4.8.2 (12/08/2020)
------------------

Features
^^^^^^^^

``common``
~~~~~~~~~~~~~~


* `SDKBACK-270 <http://jira.korp.com.br/browse/SDKBACK-270>`_\ : Added External Authentication Service used to request a Google Access Token.

----

4.8.1 (10/08/2020)
------------------

Changes
^^^^^^^

``http``
~~~~~~~~~~~~


* `FRM-1364 <http://jira.korp.com.br/browse/FRM-1364>`_\ : Interceptor now only inserts headers from access tokens that haven't expired
* `FRM-1364 <http://jira.korp.com.br/browse/FRM-1364>`_\ : Interceptor now only tries to insert headers that havent't already been inserted

----

4.8.0 (23/07/2020)
------------------

Breaking changes
^^^^^^^^^^^^^^^^

``dependencies``
~~~~~~~~~~~~~~~~~~~~


* `FRM-1329 <http://jira.korp.com.br/browse/FRM-1329>`_\ : Added ``"dompurify": "2.0.12"`` dependency

Features
^^^^^^^^

``common > notification``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1329 <http://jira.korp.com.br/browse/FRM-1329>`_\ : Notifications can now have HTML

``common``
~~~~~~~~~~~~~~


* `FRM-1289 <http://jira.korp.com.br/browse/FRM-1289>`_\ : Added ``ensureTrailingSlash`` to ``initAppSettings``

Changes
^^^^^^^

``navigation``
~~~~~~~~~~~~~~~~~~


* `FRM-1343 <http://jira.korp.com.br/browse/FRM-1343>`_\ : Update notification sidebar style

Bug Fixes
^^^^^^^^^

``navigation``
~~~~~~~~~~~~~~~~~~


* `FRM-1349 <http://jira.korp.com.br/browse/FRM-1349>`_\ : Fix "No provider for MatSnackBar" error

``components > tab-group``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1335 <http://jira.korp.com.br/browse/FRM-1335>`_\ : Subroutes can now be used and will work properly

``common > notification``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1290 <http://jira.korp.com.br/browse/FRM-1290>`_\ : Fixed an issue where notification messages would be duplicated when multiple tabs were open

Other
^^^^^


* `FRM-1351 <http://jira.korp.com.br/browse/FRM-1351>`_\ , `FRM-1014 <http://jira.korp.com.br/browse/FRM-1014>`_\ : Test and general stability and performance improvements

----

4.7.1 (07/07/2020)
------------------

Bug Fixes
^^^^^^^^^

``components > tree-table``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1326 <http://jira.korp.com.br/browse/FRM-1326>`_\ : Fixed a bug where columns wouldn't resize correctly when ``fitColumns = false``

----

4.7.0 (06/07/2020)
------------------

Breaking changes
^^^^^^^^^^^^^^^^

``components > tree-table``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1324 <http://jira.korp.com.br/browse/FRM-1324>`_\ : Removed group funcitonality

Features
^^^^^^^^

``components > tree-table``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1320 <http://jira.korp.com.br/browse/FRM-1320>`_\ : Added ``'single'`` selection mode
* `FRM-1321 <http://jira.korp.com.br/browse/FRM-1321>`_\ : Added a new way to define column sizes with ``columnSizing``\ , ``fitColumns``\ , ``minColSize`` and ``defaultColSize`` properties
* `FRM-1322 <http://jira.korp.com.br/browse/FRM-1322>`_\ : Added column resizing
* `FRM-1324 <http://jira.korp.com.br/browse/FRM-1324>`_\ : Updated visual styles to be more in line with ``<vs-grid>``\ , added ``isLoading`` property, added "no results" message

Bug Fixes
^^^^^^^^^

``components > filter``
~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1325 <http://jira.korp.com.br/browse/FRM-1325>`_\ : Fixed a bug where ``filterOptions.getItems`` would have undefined params when using default values

----

4.6.0 (29/06/2020)
------------------

Features
^^^^^^^^

``components > grid``
~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1241 <http://jira.korp.com.br/browse/FRM-1241>`_\ : Added option to clear selection upon filtering when selection mode is set to ``'checkbox'``

``components > datepicker``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1226 <http://jira.korp.com.br/browse/FRM-1226>`_\ : You can now type in the time field in the datepicker overlay

``components > tree-table``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


* `FRM-1275 <http://jira.korp.com.br/browse/FRM-1275>`_\ : Added filter features from grid (caching requires setting ``cacheId`` property)
* `FRM-1276 <http://jira.korp.com.br/browse/FRM-1276>`_\ : Added column sorting (caching requires setting ``cacheId`` property)
* `FRM-1277 <http://jira.korp.com.br/browse/FRM-1277>`_\ : Added ``type`` property to columns

  * Default styling/formatting columns can be used as well as custom ones can be created by declaring a ``vsTemplate`` inside the Tree Table
  * ``'boolean'``\ , ``'currency'``\ , ``'currency-precision'``\ , ``'date'``\ , ``'date-time'`` and ``'number'`` have default filter settings that can be overridden if neccessary

* `FRM-1277 <http://jira.korp.com.br/browse/FRM-1277>`_\ : Added ``translate`` property to columns
* `FRM-1278 <http://jira.korp.com.br/browse/FRM-1278>`_\ : Added actions column to tree-table
* `FRM-1279 <http://jira.korp.com.br/browse/FRM-1279>`_\ : Added the ability to reorder columns
* `FRM-1280 <http://jira.korp.com.br/browse/FRM-1280>`_\ : Added ``children`` and ``expanded`` properties to ``VsTreeTableNode``
* `FRM-1280 <http://jira.korp.com.br/browse/FRM-1280>`_\ : Added ``data-tt-*`` attributes to many parts of the component to make testing easier
* `FRM-1280 <http://jira.korp.com.br/browse/FRM-1280>`_\ : Added ``rowData`` variable to custom templates

Bug Fixes
^^^^^^^^^

``components > filter``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

* `FRM-1280 <http://jira.korp.com.br/browse/FRM-1280>`_\ : Fixed error message when retrieving cache in some rare cases
* `FRM-1298 <http://jira.korp.com.br/browse/FRM-1298>`_\ : Fixed a bug that caused the search in ``selection`` mode to also apply a ``text`` filter
* `FRM-1293 <http://jira.korp.com.br/browse/FRM-1293>`_\ : Refactored layout in a way that makes z-index manipulation unnecessary, fixing many small layout issues

``components > grid``
~~~~~~~~~~~~~~~~~~~~~~~~~

* `FRM-1287 <http://jira.korp.com.br/browse/FRM-1287>`_\ : Fixed a bug that caused the grid to never call ``get`` if all columns had their filters manually disabled
* `FRM-560 <http://jira.korp.com.br/browse/FRM-560>`_\ : Fixed a bug that caused ``get`` to be called twice when sorting a column

Breaking Changes
^^^^^^^^^^^^^^^^

``components > grid`` ➡ ``components > shared > table``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* `FRM-1277 <http://jira.korp.com.br/browse/FRM-1277>`_\ : ``VsGridCell`` renamed to ``VsTableCell`` and import moved from ``'@viasoft/components/grid'`` to ``'@viasoft/components/shared'``

``components > grid`` ➡ ``components > filter``\ , ``common``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* `FRM-1275 <http://jira.korp.com.br/browse/FRM-1275>`_\ : Filter imports have been moved from ``@viasoft/components/grid`` to ``@viasoft/components/filter`` and ``@viasoft/common``

----

4.5.1 (04/06/2020)
------------------

Bug Fixes
^^^^^^^^^

* 
  **components/gadget** - `FRM-1283 <http://jira.korp.com.br/browse/FRM-1283>`_


  * Fixed gadget content and footer displaying incorrectly

* 
  **components/dialog** - `FRM-1281 <http://jira.korp.com.br/browse/FRM-1281>`_


  * Fixed a bug that caused dialogs to have a minimum width

----

4.5.0 (02/06/2020)
------------------

Features
^^^^^^^^

* 
  **components/grid** - `FRM-1207 <http://jira.korp.com.br/browse/FRM-1207>`_


  * Revamped filter UI

    * Added option to customize available and default operators for each column, including custom ones
    * Improved filter accessibility, highlighting columns with applied filters as well as the filter "toggle"
    * Removed the Material Datepicker dependency, meaning you should no longer need to provide a ``DateAdapter``
    * Added "selection" mode

      * Lets you provide the user with a list of options, letting them select one or more items to filter by

    * See ``filterOptions`` properties in each column for more info

* 
  **components/grid** - `FRM-1238 <http://jira.korp.com.br/browse/FRM-1238>`_


  * Added ``filterOptions.useField`` to column settings

    * Allows you to override which field will be used when filtering the column (not affected by ``filterFieldFormat``\ )

* 
  **components/datepicker** - `FRM-1255 <http://jira.korp.com.br/browse/FRM-1255>`_


  * You can now type in the Datepicker field

    * If value is invalid, the field will be cleared

  * Date selecion overlay is shown only when clicking the icon

    * Selecting a date will close it, but selecting a time won't

  * Re-added ``readonly`` property

* 
  **components/dialog** - `FRM-1261 <http://jira.korp.com.br/browse/FRM-1261>`_


  * ``vs-dialog`` can now be used inside regular Angular Material dialogs

* 
  **other** - `FRM-1258 <http://jira.korp.com.br/browse/FRM-1258>`_


  * Angular Material dialogs now have a minimum width

Changes
^^^^^^^

* **components/grid** - `FRM-1237 <http://jira.korp.com.br/browse/FRM-1237>`_

  * Changed default tag color in ``VsGridTagColumn``

Breaking Changes
^^^^^^^^^^^^^^^^

* 
  **components/grid** - `FRM-1207 <http://jira.korp.com.br/browse/FRM-1207>`_


  * Removed ``vs-data-grid``\ , please use ``vs-grid`` exclusively from now on
  * Grid import changed from ``@viasoft/components/grids`` to ``@viasoft/components/grid``
  * Renamed ``IVsGridCell`` to ``VsGridCell``

* 
  **components/textarea** - `FRM-1254 <http://jira.korp.com.br/browse/FRM-1254>`_


  * Removed mask functionality
  * This also fixes a bug where the textarea prevented the user from pressing the ``UP`` key

* 
  **components/layout** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Added ``vs-layout``\ :

    * Read more about it `here <https://viasoftfrontend.korp.com.br/pt/master/library/components/layout/samples/>`_.

  * Use ``fill`` attribute to make ``vs-layout`` fill 100% height

    * Usage: ``<vs-layout fill> ... </vs-layout>``

* 
  **components/form** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Added ``vs-form``\ :

    * Independent from ``vs-layout``
    * Dumb component used to provide ``group-x`` functionality previously found in ``vs-form-group``\ ;
    * Using a ``vs-form`` inside a ``vs-layout`` with the ``solid`` attribute provides roughly the same functionality as a ``vs-form-group`` used to.

  * ``nested`` attribute can be added to nested components to force margin removal when it can't be done automatically

    * Usage: ``<vs-form> <form> <element nested></element> </form> </vs-form>``

* 
  **components/card** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Removed ``VsCardModule`` and its contents, meaning ``vs-card``\ , ``vs-panel``\ , ``vs-modal``\ , ``vs-form-group`` and ``vs-modal-search`` no longer exist. Please use ``vs-layout`` exclusively from now on.

* 
  **components/data-card** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Removed ``VsDataCardModule`` and its contents.

* 
  **components/dialog** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Refactored dialog to use ``vs-layout`` internally, providing much better layout consistency inside dialogs;
  * Removed unused ``isLoading`` attribute.

* 
  **components/select-modal-legacy** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Refactored modal to use ``vs-layout`` internally.

* 
  **components/select-modal** - `FRM-1197 <http://jira.korp.com.br/browse/FRM-1197>`_


  * Refactored modal to use ``vs-layout`` internally.

Bug Fixes
^^^^^^^^^

* 
  **common/validators** - `FRM-1236 <http://jira.korp.com.br/browse/FRM-1236>`_


  * Fixed CnpjOrCpf validator, allowing empty value

* 
  **components/dialog** - `FRM-1258 <http://jira.korp.com.br/browse/FRM-1258>`_


  * ``vs-dialog`` will now always respect width set in options

----

4.4.1 (14/05/2020)
------------------

Changes
^^^^^^^

* **common/grid** - `FRM-1237 <http://jira.korp.com.br/browse/FRM-1237>`_

  * Changed default tag color in ``VsGridTagColumn``

Bug Fixes
^^^^^^^^^

* **common/validators** - `FRM-1236 <http://jira.korp.com.br/browse/FRM-1236>`_

  * Fixed CnpjOrCpf validator, allowing empty value

----

4.4.0 (08/05/2020)
------------------

Breaking Changes
^^^^^^^^^^^^^^^^

* **components/input** and **mask** - `FRM-1122 <http://jira.korp.com.br/browse/FRM-1122>`_\ , `FRM-1184 <http://jira.korp.com.br/browse/FRM-1184>`_

  * Removed mask package and refactored input
  * `More info on masks <https://viasoftfrontend.korp.com.br/pt/master/library/components/mask/>`_

Features
^^^^^^^^

* 
  **components/grid** - `FRM-1196 <http://jira.korp.com.br/browse/FRM-1196>`_


  * ``VsGridOptions.filterFieldFormat`` will now apply to sorting as well

* 
  **components/grid** - `FRM-1208 <http://jira.korp.com.br/browse/FRM-1208>`_


  * Added ``VsGridTagColumn``

    * This column accepts data in the following formats:

      * ``string``\ : will be displayed as a simple tag with default background and text colors
      * ``{ text: string, color?: string, textColor?: string }``\ : allows you to pick a background color (\ ``color``\ ) as long as it's a valid HTML Hex color or CSS named color, and the text color (\ ``textColor``\ ), defaulting to black or white based on the background color
      * ``Array`` of any type listed above, or a mix of them

    * Further information and guides will be available in the `docs <https://viasoftfrontend.korp.com.br/pt/master/>`_ in the future.

Changes
^^^^^^^

* **navigation** - `FRM-987 <http://jira.korp.com.br/browse/FRM-987>`_

  * Fixed active route showing up on many items or no items at all.
  * Added ``detectParameters: boolean`` property to ``IItemMenuOptions``.

    * When ``true``\ , "active" item will be determined on a closest-match basis, meaning the route ``/page?abc=123`` will be matched to an item with the path ``/page``.
    * When ``false``\ , "active" item will be determined by checking if the current route is identical to the item's path.

Bug Fixes
^^^^^^^^^

* 
  **components/grid** - `FRM-820 <http://jira.korp.com.br/browse/FRM-820>`_


  * Fixed 9-digit number formatting on phone columns.

* 
  **components/kanban** - `FRM-996 <http://jira.korp.com.br/browse/FRM-996>`_


  * Fixed filter being "stuck" after one search.

* 
  **common/initAppSettings** - `FRM-1203 <http://jira.korp.com.br/browse/FRM-1203>`_


  * Fixed request for app appsettings when cdnUrl is provided.

* 
  **components/input** - `FRM-1177 <http://jira.korp.com.br/browse/FRM-1177>`_


  * Fixed a bug where clicking on an icon suffix/prefix would cause an error to be thrown.
