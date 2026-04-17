
Changelog - SDK Core
====================

This changelog refers to the following libraries: ``@viasoft/app-core``\ , ``@viasoft/client``\ , ``@viasoft/client-core``\ , ``@viasoft/common``\ , ``@viasoft/components``\ , ``@viasoft/http``\ , ``@viasoft/navigation``\ , ``@viasoft/theming`` and ``@viasoft/view-template``.


.. warning:: 

  
  A partir de **01/05/2022** Caso o seu front faça chamadas para serviços em Golang/Delphi, as seguintes mudanças devem ser realizadas:

  :doc:`Suporte para endpoint versionado <./backend-communication-changelogs/2022-05-01-versioned-routes>`

6.4.3 (21/02/2023)
-------------------

Bug Fixes
^^^^^^^^^

- [NO-ISSUE] `components`: `grid` advancedFilter now stringifies numbers. This way problems related to decimal numbers won't happen anymore.

----

6.4.2 (18/11/2022)
-------------------

Bug Fixes
^^^^^^^^^

- `SDKF-25 <https://korp.youtrack.cloud/issue/SDKF-25>`_ - `common`: Company request now gets up to 100 companies (used to be only 10).

----

6.4.1 (03/11/2022)
-------------------

- `PRD-879 <http://jira.korp.com.br/browse/PRD-879>`_ - `http`: Fix `VsHttpInterceptor` behavior to include company headers on first request from a new Angular module;

----

6.4.0 (25/10/2022)
-------------------

Version 6.4.0 is finally released, to check all breaking changes, features and bug fixes, please check `here <./beta/6_4_0>`_

----

6.3.35 (23/09/2022)
-------------------

Breaking Changes
^^^^^^^^^^^^^^^^

- [NO-ISSUE] `common`: Now SDK handles 0 Http call response status by default.

Features
^^^^^^^^

- `PROP-956 <http://jira.korp.com.br/browse/PROP-956>`_ - `components`:  `filterOptions.onEnterKey` in `vs-grid` now allows you to know when a enter key was pressed inside a filter

Bug Fixes
^^^^^^^^^

- [NO-ISSUE] `common`: Fix tab title translation again (async translation keys problem).

Usability
^^^^^^^^^

- `PROP-956 <http://jira.korp.com.br/browse/PROP-956>`_ - `components`: Refactoring form components for better usability.
  - Changing `vs-icon` to `vs-button` in all prefixes/suffixes of vs form components (This helps to improve the site accessibility).

----

6.3.33 (22/09/2022)
-------------------

Bug Fixes
^^^^^^^^^

- `FRM-1957 <http://jira.korp.com.br/browse/FRM-1957>`_ - `common`: Messages with | character weren't being translated correctly.

----


6.3.32 (09/08/2022)
-------------------

Bug Fixes
^^^^^^^^^

- [NO-ISSUE] `common`: Fix tab title translation.

----

6.3.31 (09/08/2022)
-------------------

Bug Fixes
^^^^^^^^^

- [NO-ISSUE] `common`: Fix External Authentication endpoints.

----

6.3.30 (04/08/2022)
-------------------

Bug Fixes
^^^^^^^^^

- `FRM-1397 <http://jira.korp.com.br/browse/FRM-1397>`_ - `components`: Fix problem in `vs-autocomplete` which was cleaning the selected value on field blur.

----

6.3.29 (18/07/2022)
-------------------

Features
^^^^^^^^

- `FRM-1941 <http://jira.korp.com.br/browse/FRM-1941>`_ - `components`: Add `required` property to `vs-autocomplete` and `vs-autocomplete-chips`.

----

6.3.28 (08/06/2022)
-------------------

Bug Fixes
^^^^^^^^^

- `FRM-1935 <http://jira.korp.com.br/browse/FRM-1935>`_ - `components`: `vs-checkbox` now will be touched when a value is set.

----

6.3.27 (19/05/2022)
-------------------

Features
^^^^^^^^

- `FRM-1931 <http://jira.korp.com.br/browse/FRM-1931>`_ - `common`: `DataLivelyService` now supports multiple subscriptions to the same notification.
  - Before this update, only one subscription was possible due to a problem related to remove method (which made all subscriptions to unsubscribe).

----

6.3.26 (04/05/2022)
-------------------

Breaking Changes
^^^^^^^^^^^^^^^^

- `FRM-1510 <http://jira.korp.com.br/browse/FRM-1510>`_ - `http`: Default error dialog now shows for the following codes: [401, 500, 503]. You can implement a custom showFunction using `VS_UI_ERROR_SETTINGS.shouldShowErrorDialog`

Features
^^^^^^^^

- `FRM-1510 <http://jira.korp.com.br/browse/FRM-1510>`_ - `http`: Default error dialog allows you to create a custom title, body or errorCode for each message. You can do it by setting a custom value for the following methods:

  - `VsHttpErrorDialogService.getErrorTitle`
  - `VsHttpErrorDialogService.getErrorBody`
  - `VsHttpErrorDialogService.getErrorCode`

- `FRM-1510 <http://jira.korp.com.br/browse/FRM-1510>`_ - `http`: Default error dialog allows you to run even on devMode using `VS_UI_ERROR_SETTINGS.shouldRunOnDevMode`.

----

6.3.25 (20/04/2022)
-------------------

Breaking Changes
^^^^^^^^^^^^^^^^
* `FRM-1917 <http://jira.korp.com.br/browse/FRM-1917>`_ - `navigation`: Navigation title prefix is `Korp ERP` rather than `Viasoft Korp`.
    
    * This is a breaking change because it breaks all visual tests.

Features
^^^^^^^^

- `FRM-1914 <http://jira.korp.com.br/browse/FRM-1914>`_ - `grid`: `options.getSelection` now allows you to provide a custom list of selected rows.
- `FRM-1923 <http://jira.korp.com.br/browse/FRM-1923>`_ - `common`: SDK now auto-updates browser tab title for the current app.

Bug Fixes
^^^^^^^^^

- `FRM-1921 <http://jira.korp.com.br/browse/FRM-1921>`_ - `components`: All form components that have `formControlName` now pass this property as a HTML attribute, fixing `vs-test.getVsInput()` method.
- `FRM-1922 <http://jira.korp.com.br/browse/FRM-1922>`_ - `common`: Fixed a bug which `VsDialog.open` didn't open in some situations based on `data` property.

----

6.3.22 (09/03/2022)
-------------------

Features
^^^^^^^^

* `FRM-1916 <http://jira.korp.com.br/browse/FRM-1916>`_ - ``grid``\ : ``options.filterOptions.useField`` now supports ``string`` or a ``function`` that returns a ``string`` value.
* `FRM-1915 <http://jira.korp.com.br/browse/FRM-1915>`_ - ``input``\ : ``errorStateMatcher`` is now a ``@Input`` property.
* `FRM-1915 <http://jira.korp.com.br/browse/FRM-1915>`_ - ``datepicker``\ : ``errorStateMatcher`` is now a ``@Input`` property.
* `FRM-1915 <http://jira.korp.com.br/browse/FRM-1915>`_ - ``select``\ : ``errorStateMatcher`` is now a ``@Input`` property.
* `FRM-1915 <http://jira.korp.com.br/browse/FRM-1915>`_ - ``textarea``\ : ``errorStateMatcher`` is now a ``@Input`` property.

----

6.3.21 (21/02/2022)
-------------------

Breaking Changes
^^^^^^^^^^^^^^^^

* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``message-dialog``\ : MESSAGE_DIALOG_SETTINGS no longer exists. It wasn't used.

Features
^^^^^^^^

* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``common``\ : ``MessageService`` now accepts ``TemplateRef`` for title / message properties.
* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``common``\ : ``MessageService`` now has a ``actionsTemplateRef`` for all methods, allowing to define a template for the actions rather than the default buttons.

Bug fixes
^^^^^^^^^

* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``grid``\ : Grid wasn't unsubscribing from confirm delete message.
* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ -\ ``common``\ : ``MessageService.isHtml`` now really works.

----

6.3.20 (17/02/2022)
-------------------

Features
^^^^^^^^

* `FRM-1662 <http://jira.korp.com.br/browse/FRM-1662>`_ - ``grid``\ : ``skipClear`` parameter in ``gridOptions.refresh`` was added, avoiding clearing the filter, pagination, sorting, etc during refresh.

----

6.3.19 (24/01/2022)
-------------------

Changes
^^^^^^^

* `FRM-1715 <http://jira.korp.com.br/browse/FRM-1715>`_ - ``common``\ : ``DataLivelyService`` and ``NotificationService`` will now connect to webhooks using ``tenantId`` and ``environmentId``\ , avoiding notification issues with multiple logins in different tenants.

Bug Fixes
^^^^^^^^^

* `FRM-1715 <http://jira.korp.com.br/browse/FRM-1715>`_ - ``common``\ : Notifications would be duplicated after reconnecting.

  * ``NotificationService`` will now unsubscribe from webhook events before reconnecting.

----

6.3.18 (24/01/2022)
-------------------

Changes
^^^^^^^

* 
  `FRM-1904 <http://jira.korp.com.br/browse/FRM-1904>`_ - `components`: Added legacy components to mitigate breaking changes in 6.3 release:


  * ``vs-checkbox-legacy``

    * From ``vs-checkbox`` to ``vs-checkbox-legacy``
    * From ``@viasoft/components/checkbox`` to ``@viasoft/components/checkbox-legacy``
    * From ``VsCheckboxModule`` to ``VsCheckboxLegacyModule``

  * ``vs-radio-button-legacy``

    * From ``vs-radio-button`` to ``vs-radio-button-legacy``
    * From ``@viasoft/components/radio-button`` to ``@viasoft/components/radio-button-legacy``
    * From ``VsRadioButtonModule`` to ``VsRadioButtonLegacyModule``

  * ``vs-select-legacy``

    * From ``vs-select`` to ``vs-select-legacy``
    * From ``@viasoft/components/select`` to ``@viasoft/components/select-legacy``
    * From ``VsSelectModule`` to ``VsSelectLegacyModule``

  * ``vs-textarea-legacy``

    * From ``vs-textarea`` to ``vs-textarea-legacy``
    * From ``@viasoft/components/textarea`` to ``@viasoft/components/textarea-legacy``
    * From ``VsTextareaModule`` to ``VsTextareaLegacyModule``

  **Note: This is a temporary way to avoid the breaking changes introduced in version 6.3 and will be removed in upcoming releases.**

----

6.3.17 (21/01/2022)
-------------------

Features
^^^^^^^^

* `FRM-1903 <http://jira.korp.com.br/browse/FRM-1903>`_ - ``stepper``\ : Added ``disabled`` property to ``vs-stepper-item``.
* `FRM-1901 <http://jira.korp.com.br/browse/FRM-1901>`_ - ``grid``\ : Get requests will now log errors.
* `FRM-657 <http://jira.korp.com.br/browse/FRM-657>`_ - ``input``\ , ``search``\ : Added ``autocomplete`` property.
* `FRM-657 <http://jira.korp.com.br/browse/FRM-657>`_ - ``select-modal``\ , ``select-modal-legacy``\ : Added ``searchInputTemplate`` property, allowing the use of custom templates.

Bug Fixes
^^^^^^^^^

* `FRM-1901 <http://jira.korp.com.br/browse/FRM-1901>`_ - ``grid``\ : An error would be thrown when ``VsGridGetResult.data`` was empty.

----

6.3.16 (19/01/2022)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-1742 <http://jira.korp.com.br/browse/FRM-1742>`_ - ``common``\ : License is now released before logout, avoiding an error modal from showing.

----

6.3.15 (20/12/2021)
-------------------

Changes
^^^^^^^

* `FRM-1898 <http://jira.korp.com.br/browse/FRM-1898>`_ - ``navigation``\ : Company selection now shows ``tradingName`` rather than ``companyName``.

----

6.3.14 (10/12/2021)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-894 <http://jira.korp.com.br/browse/FRM-894>`_ - ``navigation``\ : Navigation menu would exceed the viewport when too close to the edge.

----

6.3.13 (29/11/2021)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-1894 <http://jira.korp.com.br/browse/FRM-1894>`_ - ``components``\ : Dialog footer content would be hidden in certain cases.

----

6.3.12 (29/11/2021)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-1893 <http://jira.korp.com.br/browse/FRM-1893>`_ - ``common``\ : Licensing requests would fail when using Hydra authentication.

----

6.3.11 (25/11/2021)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-1649 <http://jira.korp.com.br/browse/FRM-1649>`_ - ``select-modal-legacy``\ : Close button would be focused automatically instead of the search input when opening a modal.
* `FRM-1819 <http://jira.korp.com.br/browse/FRM-1819>`_ - ``tree-table``\ : "Cannot read ``sortField`` of ``undefined``\ " error would be thrown during initialization in some cases.
* `FRM-1887 <http://jira.korp.com.br/browse/FRM-1887>`_ - ``input`` and other form fields: A visual bug related to the underline of disabled fields would occur when browser zoom was set to certain values.

----

6.3.10 (24/11/2021)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-1890 <http://jira.korp.com.br/browse/FRM-1890>`_ - ``datepicker``\ : Error message wouldn't show up when using validators.

----

6.3.9 (22/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1880 <http://jira.korp.com.br/browse/FRM-1880>`_ - ``navigation``\ : Company selection overflow ellipsis color didn't match the text color.
* `FRM-1877 <http://jira.korp.com.br/browse/FRM-1877>`_ - ``grid``\ : Pointer cursor was shown even when ``VsGridOptions.select`` wasn't defined.

----

6.3.8 (19/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1888 <http://jira.korp.com.br/browse/FRM-1888>`_ - ``navigation``\ : In Safari for macOS, navigation sidebar menus would show up in the wrong place when expanded.

----

6.3.7 (18/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1886 <http://jira.korp.com.br/browse/FRM-1886>`_ - ``grid``\ : Columns using sub-fields would be hidden in mobile mode.

----

6.3.6 (17/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1885 <http://jira.korp.com.br/browse/FRM-1885>`_ - ``common``\ : User image would not load correctly, causing the profile menu to be hidden.

----

6.3.5 (08/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1881 <http://jira.korp.com.br/browse/FRM-1881>`_ - ``common``\ : Licensing error dialog would always say "unknown error".

----

6.3.4 (05/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1879 <http://jira.korp.com.br/browse/FRM-1879>`_ - ``common``\ : Authentication request URl was incorrect.

----

6.3.3 (04/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1870 <http://jira.korp.com.br/browse/FRM-1870>`_ - ``common``\ : License refreshing could sometimes block the app even though the refresh request was sucessful.
* `FRM-1870 <http://jira.korp.com.br/browse/FRM-1870>`_ - ``common``\ : Licensing error dialog could sometimes not appear even though the screen would get blurred.

----

6.3.2 (27/10/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1866 <http://jira.korp.com.br/browse/FRM-1866>`_ - ``common``\ : Authorization request URL was incorrect.

----

6.3.1 (27/10/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1865 <http://jira.korp.com.br/browse/FRM-1865>`_ - ``common``\ : LicensingService was setting ``customAppName`` property incorrectly.

----

6.3.0 (22/10/2021)
------------------

Breaking changes
^^^^^^^^^^^^^^^^

**DISCLAIMER:** Breaking changes related to ``checkbox``\ /\ ``select``\ /\ ``textarea``\ /\ ``radio-group`` components have been introduced **but you can use legacy-components (CHECK 6.3.18 changelog)**


* `FRM-1801 <http://jira.korp.com.br/browse/FRM-1801>`_\ , `FRM-1816 <http://jira.korp.com.br/browse/FRM-1816>`_\ :

  * Replaced ``VS_AUTHORIZATION_PREFIX`` (from ``@viasoft/common``\ ) with ``VS_API_PREFIX`` (from ``@viasoft/http``\ );
  * Renamed ``IViasoftCommonModuleConfig.authorizationPrefix`` to ``apiPrefix``\ ;
  * This property is mandatory and will now be used for requests made to authentication endpoints. This may also be used by other libraries;
  * Authorization endpoints now start with ``authorization`` so you may need to remove it from your prefix.

* `FRM-1028 <http://jira.korp.com.br/browse/FRM-1028>`_ - ``checkbox``\ : Refactored to use ControlValueAccessor.

  * Now works just like any regular Angular form control, using either ``ngModel`` or ``formControlName``\ ;
  * Removed the ``formGroup`` and ``controlName`` properties;
  * Setting the ``disabled`` property when using reactive forms will now show a warning;
  * Removed the ``onChange`` output in favor of ``ngModelChange`` or ``valueChanges`` when using template-driven or reactive forms respectively.

* `FRM-1705 <http://jira.korp.com.br/browse/FRM-1705>`_ - ``select``\ : Refactored to use ControlValueAccessor.

  * Now works just like any regular Angular form control, using either ``ngModel`` or ``formControlName``\ ;
  * Removed the ``formGroup``\ , ``arrayName``\ , ``groupName`` and ``controlName`` properties;
  * Setting the ``disabled`` property when using reactive forms will now show a warning;
  * Added the ``hidden`` property;
  * Added the ``appearance`` property;
  * Added the ``hintLabel`` property;
  * Renamed ``VsSelect`` to ``VsSelectOption``.

* `FRM-1704 <http://jira.korp.com.br/browse/FRM-1704>`_ - ``textarea``\ : Refactored to use ControlValueAccessor.

  * Now works just like any regular Angular form control, using either ``ngModel`` or ``formControlName``\ ;
  * Removed the ``formGroup``\ , ``arrayName``\ , ``groupName`` and ``controlName`` properties;
  * Setting the ``disabled`` property when using reactive forms will now show a warning;
  * Added the ``hidden`` property;
  * Added the ``appearance`` property;
  * Added the ``type`` property;
  * Added the ``direction`` property;
  * Added the ``textAlign`` property;
  * Renamed the ``textareaAutosize`` property to ``autosize``.

* `FRM-1539 <http://jira.korp.com.br/browse/FRM-1539>`_ - ``radio-group``\ : Refactored to use ControlValueAccessor.

  * Now works just like any regular Angular form control, using either ``ngModel`` or ``formControlName``\ ;
  * Removed the ``formGroup`` and ``controlName`` properties;
  * Removed the ``disableGroup`` property;
  * Removed the ``requiredGroup`` property;
  * Removed the ``change`` output;
  * Removed the ``clickEvent``\ , ``keyEnterEvent``\ , ``blurEvent``\ , ``changeEvent`` and ``focusEvent`` outputs;
  * Setting the ``disabled`` property when using reactive forms will now show a warning;
  * Renamed the ``position`` property to ``horizontal``\ ;
  * Renamed the ``radios`` property to ``options``\ ;
  * Renamed the ``@viasoft/components/radio-button`` entry point to ``@viasoft/components/radio-group``\ ;
  * Renamed the ``vs-radio-button`` selector to ``vs-radio-group``\ ;
  * Renamed the ``VsRadioButtonModule`` class to ``VsRadioGroupModule``\ ;
  * Renamed the ``VsRadioButtonOptions`` interface to ``VsRadioGroupOption``.

* `FRM-1770 <http://jira.korp.com.br/browse/FRM-1770>`_ - ``common``\ : Added tenant and user IDs to keys saved in Local Storage through ``VsStorageService``.

  * Renamed ``StorageService`` to ``VsStorageService``\ ;
  * Removed ``STORAGE_PREFIX`` injection token;
  * Added ``VS_STORAGE_OPTIONS`` injection token, used for disabling tenant/app/user IDs;
  * *Note: all legacy keys saved will be updated automatically upon being used*

Features
^^^^^^^^

* `FRM-1799 <http://jira.korp.com.br/browse/FRM-1799>`_ - ``form-utils``\ : Made ``@viasoft/components/form-utils`` available for use.

  * Includes the following classes:

    * ``FormManipulator``\ : Ready-to-use implementation of ControlValueAccessor, read internal code for an explanation of each method;
    * ``FormElement``\ : Extends ``FormManipulator``\ , adding ``@Output()`` properties for ``click``\ , ``keyEnter``\ , ``blur`` and ``focus`` events;
    * ``FormInput``\ : Extends ``FormElement``\ , adding ``@Input()`` properties for ``readonly``\ , ``maxLength``\ , ``required``\ , ``errorMessage``\ , ``type``\ , ``direction`` and ``textAlign``.

  * Also includes a few useful types, mainly used in ``FormInput``\ :

    * ``InputType``\ : All possible ``<input />`` types;
    * ``TextAlignment``\ : All possible CSS ``text-align`` values;
    * ``TextDirection``\ : All possible HTML ``dir`` values.

* `FRM-1805 <http://jira.korp.com.br/browse/FRM-1805>`_ - ``tree-table``\ : Added ``collapse`` event.

  * Works similarly to the ``expand`` event, except it's fired whenever a row is collapsed.

Bug fixes
^^^^^^^^^

* `FRM-1796 <http://jira.korp.com.br/browse/FRM-1796>`_ - ``grid``\ : Mobile mode grid wouldn't occupy 100% of the screen width in some cases.
* `FRM-1808 <http://jira.korp.com.br/browse/FRM-1808>`_ - ``grid``\ : Get request could be called twice when ``enableFilter`` was set to ``false``.
* `FRM-656 <http://jira.korp.com.br/browse/FRM-656>`_ - ``tabs-view-template``\ : Tab groups inside a ``router-outlet`` didn't take up the full width.

----

6.2.17 (21/02/2022)
-------------------

Breaking Changes
^^^^^^^^^^^^^^^^

* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``message-dialog``\ : MESSAGE_DIALOG_SETTINGS no longer exists. It wasn't used.

----

Features
^^^^^^^^

* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``common``\ : ``MessageService`` now accepts ``TemplateRef`` for title / message properties.
* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``common``\ : ``MessageService`` now has a ``actionsTemplateRef`` for all methods, allowing to define a template for the actions rather than the default buttons.

Bug fixes
^^^^^^^^^

* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ - ``grid``\ : Grid wasn't unsubscribing from confirm delete message.
* `FRM-1910 <http://jira.korp.com.br/browse/FRM-1910>`_ -\ ``common``\ : ``MessageService.isHtml`` now really works.

----

6.2.16 (17/02/2022)
-------------------

Features
^^^^^^^^

* `FRM-1662 <http://jira.korp.com.br/browse/FRM-1662>`_ - ``grid``\ : ``skipClear`` parameter in ``gridOptions.refresh`` was added, avoiding clearing the filter, pagination, sorting, etc during refresh.

----

6.2.15 (27/01/2022)
-------------------

Bug fixes
^^^^^^^^^

* `FRM-1796 <http://jira.korp.com.br/browse/FRM-1796>`_ - ``grid``\ : Mobile mode grid wouldn't occupy 100% of the screen width in some cases.

----

6.2.14 (24/01/2022)
-------------------

Changes
^^^^^^^

* `FRM-1715 <http://jira.korp.com.br/browse/FRM-1715>`_ - ``common``\ : ``DataLivelyService`` and ``NotificationService`` will now connect to webhooks using ``tenantId`` and ``environmentId``\ , avoiding notification issues with multiple logins in different tenants.

Bug fixes
^^^^^^^^^

* `FRM-1715 <http://jira.korp.com.br/browse/FRM-1715>`_ - ``common``\ : Notifications would be duplicated after reconnecting.

  * ``NotificationService`` will now unsubscribe from webhook events before reconnecting.

6.2.13 (24/01/2022)
-------------------

Features
^^^^^^^^

* `FRM-1903 <http://jira.korp.com.br/browse/FRM-1903>`_ - ``vs-stepper-item``\ : Added ``disabled`` property.
* `FRM-1901 <http://jira.korp.com.br/browse/FRM-1901>`_ - ``grid``\ : Get requests will now log errors.
* `FRM-657 <http://jira.korp.com.br/browse/FRM-657>`_ - ``input``\ , ``search``\ : Added ``autocomplete`` property.
* `FRM-657 <http://jira.korp.com.br/browse/FRM-657>`_ - ``select-modal`` (current / legacy): Added ``searchInputTemplate`` property, allowing to use custom templates for search input inside modals.

Bug Fixes
^^^^^^^^^

* `FRM-1901 <http://jira.korp.com.br/browse/FRM-1901>`_ - ``grid``\ : An error would be thrown when ``VsGridGetResult.data`` was empty.

----

6.2.12 (19/01/2022)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-1742 <http://jira.korp.com.br/browse/FRM-1742>`_ - ``common``\ : License is now released before logout, avoiding an error modal from showing.

----

6.2.11 (22/12/2021)
-------------------

Changes
^^^^^^^

* `FRM-1898 <http://jira.korp.com.br/browse/FRM-1898>`_ - ``navigation``\ : Company selection now shows ``tradingName`` rather than ``companyName``.

----

6.2.10 (10/12/2021)
-------------------

Bug Fixes
^^^^^^^^^

* `FRM-894 <http://jira.korp.com.br/browse/FRM-894>`_ - ``navigation``\ : Navigation menu would exceed the viewport when too close to the edge.

----

6.2.9 (29/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1894 <http://jira.korp.com.br/browse/FRM-1894>`_ - ``components``\ : Dialog footer content would be hidden in certain cases.

----

6.2.8 (26/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1893 <http://jira.korp.com.br/browse/FRM-1893>`_ - ``common``\ : Licensing requests would fail when using Hydra authentication.

----

6.2.7 (25/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1649 <http://jira.korp.com.br/browse/FRM-1649>`_ - ``select-modal-legacy``\ : Close button would be focused automatically instead of the search input when opening a modal.
* `FRM-1819 <http://jira.korp.com.br/browse/FRM-1819>`_ - ``tree-table``\ : "Cannot read ``sortField`` of ``undefined``\ " error would be thrown during initialization in some cases.
* `FRM-1887 <http://jira.korp.com.br/browse/FRM-1887>`_ - ``input`` and other form fields: A visual bug related to the underline of disabled fields would occur when browser zoom was set to certain values.

----

6.2.6 (24/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1890 <http://jira.korp.com.br/browse/FRM-1890>`_ - ``datepicker``\ : Error message wouldn't show up when using validators.

----

6.2.5 (22/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1880 <http://jira.korp.com.br/browse/FRM-1880>`_ - ``navigation``\ : Company selection overflow ellipsis color didn't match the text color.
* `FRM-1877 <http://jira.korp.com.br/browse/FRM-1877>`_ - ``grid``\ : Pointer cursor was shown even when ``VsGridOptions.select`` wasn't defined.

----

6.2.4 (19/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1888 <http://jira.korp.com.br/browse/FRM-1888>`_ - ``navigation``\ : In Safari for macOS, navigation sidebar menus would show up in the wrong place when expanded.

----

6.2.3 (18/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1886 <http://jira.korp.com.br/browse/FRM-1886>`_ - ``grid``\ : Columns using sub-fields would be hidden in mobile mode.

----

6.2.2 (08/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1881 <http://jira.korp.com.br/browse/FRM-1881>`_ - ``common``\ : Licensing error dialog would always say "unknown error".

----

6.2.1 (04/11/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1870 <http://jira.korp.com.br/browse/FRM-1870>`_ - ``common``\ : License refreshing could sometimes block the app even though the refresh request was sucessful.
* `FRM-1870 <http://jira.korp.com.br/browse/FRM-1870>`_ - ``common``\ : Licensing error dialog could sometimes not appear even though the screen would get blurred.
* `FRM-1865 <http://jira.korp.com.br/browse/FRM-1865>`_ - ``common``\ : LicensingService was setting ``customAppName`` property incorrectly.

----

6.2.0 (13/10/2021)
------------------

Dependency updates
^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - ``ua-parser-js``
     - ✅ Added
     - ``^0.7.28``


.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
     - Version
   * - ``@types/ua-parser-js``
     - ✅ Added
     - ``^0.7.36``


Features
^^^^^^^^

* `FRM-1800 <http://jira.korp.com.br/browse/FRM-1800>`_ - ``common``\ : Added option to customize the authorization route prefix

  * Authorization routes now follow the new API;
  * A prefix should be specified in ``VsAppCoreModule`` so that API calls go through your app's backend;
  * By default the prefix is set to ``"authorization"``\ ;
  * The ``VS_AUTHORIZATION_PREFIX`` injection token can be used by other applications and/or libraries.

Changes
^^^^^^^

* `FRM-1761 <http://jira.korp.com.br/browse/FRM-1761>`_ - ``common``\ : Implemented new licensing API.
* `FRM-1782 <http://jira.korp.com.br/browse/FRM-1782>`_ - ``input``\ , ``select``\ , ``search-input``\ , ``textarea``\ , ``datepicker``\ , ``dropdown``\ , ``autocomplete``\ , ``chip-list``\ : Visual refresh.

  * The following CSS custom properties are available for customization, though they should only be used in specific cases:

    * ``--vs-form-field-color-disabled``\ : Applied to the text color of disabled fields;
    * ``--vs-form-field-color-underline``\ : Applied to the field underline color (dotted and on hover);
    * ``--vs-form-field-color-label``\ : Applied to the placeholder and hint label colors;
    * ``--vs-form-field-color-error``\ : Applied to the required indicator and error label.

----

6.1.3 (08/10/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1810 <http://jira.korp.com.br/browse/FRM-1810>`_ - ``tree-view``\ : Items with children were not being indented correctly.

----

6.1.2 (22/09/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1795 <http://jira.korp.com.br/browse/FRM-1795>`_ - ``message-dialog``\ : Action buttons were center-aligned instead of right-aligned.

----

6.1.1 (21/09/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1794 <http://jira.korp.com.br/browse/FRM-1794>`_ - ``checkbox``\ : Frame and ripple would get cut off after interaction in some very specific cases.

----

6.1.0 (06/09/2021)
------------------

Breaking changes
^^^^^^^^^^^^^^^^


* 
  `FRM-1763 <http://jira.korp.com.br/browse/FRM-1763>`_ - ``grid``\ : Renamed ``none`` option to ``center`` in ``VsGridColumnSettings.align``.

* 
  `FRM-1620 <http://jira.korp.com.br/browse/FRM-1620>`_ - ``navigation``\ : Removed ``IItemMenuOptions.functionPath``.

Dependency updates
^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - ``primeng``
     - 🔃 Updated
     - ``~12.1.0``


*Note: the ``~`` is important! It guarantees that only patch (\ ``x.x.X``\ ) versions can be installed automatically, whereas ``^`` allows for minor (\ ``x.X.x``\ ) versions to be installed as well.*

Features
^^^^^^^^

* `FRM-1465 <http://jira.korp.com.br/browse/FRM-1465>`_ - ``common``\ : Added ``errorCodes`` property to ``VsUiErrorSettings``.

  * This property gives developers control over which HTTP error codes should automatically show an error dialog.
  * By default, the following error codes show a dialog: 401, 404 and 500.

Changes
^^^^^^^

* `FRM-1763 <http://jira.korp.com.br/browse/FRM-1763>`_ - ``grid``\ , ``tree-table``\ : Visual refresh.
* `FRM-1763 <http://jira.korp.com.br/browse/FRM-1763>`_\ : Refactored PrimeNG theme and removed styles that weren't being used by SDK components.

Bug Fixes
^^^^^^^^^

* `FRM-1763 <http://jira.korp.com.br/browse/FRM-1763>`_ - ``grid``\ : Checkbox selection column could mess up the column size calculation.
* `FRM-1763 <http://jira.korp.com.br/browse/FRM-1763>`_ - ``grid``\ : Horizontal scrollbar could show up when it shouldn't.

----

6.0.0 (17/08/2021)
------------------

This release is focused around updating to Angular 12. It is crucial that you follow these steps in this exact order when updating your apps and libraries. Do not try to update an app directly to Angular 12, it is mandatory to update to versions 10 and 11 first.

Before updating
^^^^^^^^^^^^^^^


* Remember to commit after each step. The Angular update command won't run on a dirty repository, and it will be easier to roll back any mistakes if you commit frequently.
* After each "dependency update" step, you might need to delete your ``node_modules`` folder and ``package-lock.json`` file and run ``npm i`` again.
* If at any point ``ng update`` refuses to run because of mismatched versions, perform the following steps:

  * Search for the package name on `https://npmjs.org <https://npmjs.org>`_\ ;
  * Go to the package's repository;
  * On the branch selection dropdown, go to Tags and select the version you're currently using;
  * Open the ``package.json`` file and look for the dependency you need;
  * Repeat for each version higher than the one you're currently looking at until you find the first one that has a compatible dependency version;
  * Update your project's ``package.json`` to that version, delete ``node_modules`` and ``package-lock.json``\ , run ``npm i`` and try again.

* Since ``@viasoft/*`` packages don't have support for versions 10 and 11, you may have to temporarily remove them from your dependencies and add them back after completing the update to version 12.

Migrating to Angular 10
^^^^^^^^^^^^^^^^^^^^^^^

1. Update dependencies
~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @angular/cdk
     - 🔄 Updated
     - ``~10.2.7``
   * - @swimlane/ngx-charts
     - ❌ Removed
     - 
   * - @swimlane/ngx-dnd
     - ❌ Removed
     - 


.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
     - Version
   * - tsickle
     - 🔄 Updated
     - ``^0.40.0``
   * - @angular-devkit/build-ng-packagr
     - 🔄 Updated
     - ``~0.1002.3``


2. Update Angular
~~~~~~~~~~~~~~~~~

Run the following command:

.. code-block:: shell

   ng update @angular/core@10 @angular/cli@10 @angular/material@10

Migrating to Angular 11
^^^^^^^^^^^^^^^^^^^^^^^

1. Update dependencies
~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - primeng
     - 🔄 Updated
     - ``^11.4.5``
   * - primeicons
     - 🔄 Updated
     - ``^4.1.0``


2. Update Angular
~~~~~~~~~~~~~~~~~

Run the following command:

.. code-block:: shell

   ng update @angular/core@11 @angular/cli@11 @angular/material@11

Migrating to Angular 12
^^^^^^^^^^^^^^^^^^^^^^^

1. Update dependencies
~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @fortawesome/fontawesome-pro
     - 🔄 Updated
     - ``^5.15.0``
   * - primeng
     - 🔄 Updated
     - ``~12.0.2``


.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
   * - @angular-devkit/build-ng-packagr
     - ❌ Removed


2. Update Angular
~~~~~~~~~~~~~~~~~

Run the following command:

.. code-block:: shell

   ng update @angular/core@12 @angular/cli@12 @angular/material@12

Run migrations manually
^^^^^^^^^^^^^^^^^^^^^^^

Angular Material
~~~~~~~~~~~~~~~~

Run the following command to apply the Angular Material migrations:

.. code-block:: shell

   ng update @angular/material@12 --migrate-only --from=9

Angular Core
~~~~~~~~~~~~

Run the following command to apply the Angular Core migrations:

.. code-block:: shell

   ng update @angular/core@12 --migrate-only --from=9

Angular CLI
~~~~~~~~~~~

Run the following command to apply the Angular CLI migrations:

.. code-block:: shell

   ng update @angular/cli@12 --migrate-only --from=9

Additional steps
^^^^^^^^^^^^^^^^

Remove AOT flag from your projects
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The AOT flag is no longer needed. You may remove any mentions of ``--aot`` or ``"aot": true`` from ``package.json`` or ``angular.json``.

Replace the production flag
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``--prod`` flag is deprecated and should be replaced with ``--configuration=production``.

Fix Sass warnings
^^^^^^^^^^^^^^^^^

The new version of Sass emits warnings during build related to division using the ``/`` symbol. As this is a future breaking change, we recommend running the following command to fix these warnings:

.. code-block:: shell

   npm install -g sass-migrator
   sass-migrator division **/*.scss

More information can be found at `https://sass-lang.com/documentation/breaking-changes/slash-div <https://sass-lang.com/documentation/breaking-changes/slash-div>`_.

Fix PrimeNG class names
^^^^^^^^^^^^^^^^^^^^^^^

PrimeNG 10 migrated to the PrimeOne theming system, which changes all class names. If you're using these classes to either customize PrimeNG components or select components in tests, you'll need to perform the changes found at `https://github.com/primefaces/primeng/wiki/PrimeOne-Migration <https://github.com/primefaces/primeng/wiki/PrimeOne-Migration>`_.

Update libraries to Ivy
^^^^^^^^^^^^^^^^^^^^^^^

View Engine libraries are now deprecated since they can be built using Ivy in partial compatibility mode. This is the officially recommended upgrade path.

To start using Ivy for your libraries, simply perform the following change in ``tsconfig.lib.prod.json`` in each of your libraries:

.. code-block:: json
     
    {
     "extends": "./tsconfig.lib.json",
     ...
     "angularCompilerOptions": {
   -   "enableIvy": false, // Remove this line...
   +   "compilationMode": "partial" // ...and add this one
      }
    }

Update library build targets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In ``angular.json``\ , replace any mentions of ``@angular-devkit/build-ng-packagr:build`` with ``@angular-devkit/build-angular:ng-packagr``.

Update dependencies
^^^^^^^^^^^^^^^^^^^

These are the final dependency tables, go through each dependency and perform the necessary changes.

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @angular/animations
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/cdk
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/common
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/compiler
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/core
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/forms
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/material
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/platform-browser
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/platform-browser-dynamic
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/router
     - 🔄 Updated
     - ``~12.2.1``
   * - @fortawesome/fontawesome-pro
     - 🔄 Updated
     - ``^5.15.4``
   * - @microsoft/signalr
     - 🔄 Updated
     - ``5.0.9``
   * - @sentry/browser
     - 🔄 Updated
     - ``^6.11.0``
   * - @viasoft/app-core
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/client
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/client-core
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/common
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/components
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/http
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/navigation
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/theme
     - 🔄 Updated
     - ``6.0.0``
   * - @viasoft/view-template
     - 🔄 Updated
     - ``6.0.0``
   * - angular-imask
     - 🔄 Updated
     - ``^6.1.0``
   * - angular-oauth2-oidc
     - 🔄 Updated
     - ``^12.0.2``
   * - dateformat
     - 🔄 Updated
     - ``^4.5.1``
   * - dompurify
     - 🔄 Updated
     - ``^2.3.0``
   * - imask
     - 🔄 Updated
     - ``^6.1.0``
   * - jwt-decode
     - 🔄 Updated
     - ``^3.1.2``
   * - primeicons
     - 🔄 Updated
     - ``^4.1.0``
   * - primeng
     - 🔄 Updated
     - ``~12.0.2``
   * - rxjs
     - 🔄 Updated
     - ``~6.6.0``
   * - single-spa
     - 🔄 Updated
     - ``^5.9.3``
   * - single-spa-angular
     - 🔄 Updated
     - ``^5.0.2``
   * - tslib
     - 🔄 Updated
     - ``^2.3.0``
   * - util
     - 🔄 Updated
     - ``^0.12.4``
   * - zone.js
     - 🔄 Updated
     - ``~0.11.4``
   * - @swimlane/ngx-charts
     - ❌ Removed
     - 
   * - @swimlane/ngx-dnd
     - ❌ Removed
     - 
   * - rxjs-compat
     - ❌ Removed
     - 


.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
     - Version
   * - @angular-devkit/build-angular
     - 🔄 Updated
     - ``~12.2.0``
   * - @angular/cli
     - 🔄 Updated
     - ``~12.2.0``
   * - @angular/compiler-cli
     - 🔄 Updated
     - ``~12.2.1``
   * - @angular/language-service
     - 🔄 Updated
     - ``~12.2.1``
   * - tsickle
     - 🔄 Updated
     - ``^0.40.0``
   * - tslint
     - 🔄 Updated
     - ``~6.1.3``
   * - typescript
     - 🔄 Updated
     - ``~4.3.5``
   * - @angular-devkit/build-ng-packagr
     - ❌ Removed
     - 
