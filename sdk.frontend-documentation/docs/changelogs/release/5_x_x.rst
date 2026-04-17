
Changelog - 5.x.x Releases
==========================

5.7.0 (17/08/2021)
------------------

This release focuses on housekeeping as it is the last version to be using Angular 9. A lot of internal files have been removed, and components that aren't commonly used have been moved to separate libraries.

Breaking changes
^^^^^^^^^^^^^^^^

* `FRM-1440 <http://jira.korp.com.br/browse/FRM-1440>`_ - ``text-editor``\ : Moved the ``text-editor`` component to a separate library

  * To migrate, simply install ``@viasoft/text-editor`` and fix all ``text-editor``\ -related imports

* `FRM-1441 <http://jira.korp.com.br/browse/FRM-1441>`_ - ``map``\ : Moved the ``map`` component to a separate library

  * To migrate, simply install ``@viasoft/map`` and fix all ``map``\ -related imports

Dependency changes
^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @microsoft/signalr
     - 🔄 Updated
     - 5.0.7


For projects that *don't* use the ``map`` component:

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
   * - @agm/core
     - ❌ Removed
   * - @asymmetrik/ngx-leaflet
     - ❌ Removed
   * - leaflet
     - ❌ Removed


For projects that *don't* use the ``text-editor`` component:

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
   * - ngx-quill
     - ❌ Removed
   * - quill
     - ❌ Removed

Features
^^^^^^^^

* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - `common`: Custom services available for:

  * DataLivelyService
  * NotificationService

* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : Websocket connections now have an ``AutomaticReconnect`` flag.
* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : Notifying users about a new notification can now be done using ``NotificationService.notifyUser``.
* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : Added ``shouldNotifyUser`` parameter to ``NotificationService.addNotification``\ , letting you notify users about a new notification (default ``true``\ ).

Bug Fixes
^^^^^^^^^

* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : Internal subscriptions were not being unsubscribed after being used.
* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : Only the first websocket notification was being showed.
* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``navigation``\ : Notification snackbar had low contrast on the action button.
* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : ``DataLivelyNotificationUpdateIdInterceptor`` was replacing ``NotificationUpdateId`` header.
* `FRM-1737 <http://jira.korp.com.br/browse/FRM-1737>`_ - ``grid``\ : Error message would show up instead of the "no result" message in very specific cases.
* `FRM-1719 <http://jira.korp.com.br/browse/FRM-1719>`_\ : User could sometimes stay logged in even after their token had expired.
* `FRM-1694 <http://jira.korp.com.br/browse/FRM-1694>`_ - ``grid``\ : "More actions" button would show up even without any actions inside.

Housekeeping
^^^^^^^^^^^^

* `FRM-1686 <http://jira.korp.com.br/browse/FRM-1686>`_ - ``common``\ : Performance improvements in ``VsCommonModule``.
* `FRM-1754 <http://jira.korp.com.br/browse/FRM-1754>`_\ : Removed unused files and libraries.

----

5.6.0 (11/06/2021)
------------------

This release introduces changes to accomodate for a new authentication flow. **This will break local and production environments, so be careful before updating your apps.**

Bug Fixes
^^^^^^^^^

* `FRM-1442 <http://jira.korp.com.br/browse/FRM-1442>`_ - ``http``\ : HTTP headers interceptor was being called twice.

Breaking changes
^^^^^^^^^^^^^^^^

* `FRM-1442 <http://jira.korp.com.br/browse/FRM-1442>`_\ : Authentication flow was updated to a better and more secure version.

  * Fixes a problem where login was trying to use a mock access token (if it was already in ``localStorage``\ )

    * Authentication now handles mock access tokens and deletes them automatically when needed.

  * *Silent refresh is no longer used*\ , a *refresh token request* replaces its functionality
  * URL hash is now being handled and automatically deleted after login process;
  * ``runInitialLoginSequence`` now accepts ``disableAutoLogoutOnError`` flag

    * This flag will avoid logout when an login error occur

  * ``hydraGetUtcTimeUrl`` is no longer used
  * ``VsAuthService`` constructor properties changed

This is a breaking change because the new authentication process conflicts with the previous one. Please use the following migration tutorial to make sure your app's authentication will work locally and in production.

Migration Guide
^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - angular-oauth2-oidc
     - ✅ Added
     - 10.0.3
   * - @viasoft/angular-oauth2-oidc
     - ❌ Removed
     - 


#. Update SDK packages to ``5.6.0``
#. Replace '@viasoft/angular-oauth2-oidc' with 'angular-oauth2-oidc'
#. ``hydraGetUtcTimeUrl`` is no longer used, you can remove it
#. Delete ``silent-refresh.html`` and remove its references from ``angular.json``

Updating Identity Server (locally)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**This will reset your database and Docker. Save anything important before proceeding.**

If you use Identity Server, please do the following steps:


#. Run ``git pull`` in @viasoft/infrastructure;
#. Run ``reset-docker.ps1`` from @viasoft/infrastructure;
#. Run ``setup.ps1`` from @viasoft/infrastructure;

Updating Hydra (locally)
~~~~~~~~~~~~~~~~~~~~~~~~

#. Run the following command in terminal:

.. code-block:: bash

   # Please notice that this is configuring a client for the `localhost:4200` URL, which can be changed if needed

   hydra clients create --endpoint "http://localhost:4445" --id portal -g "authorization_code,refresh_token" -r "code,id_token,token,id_token token" -a "openid,profile,offline_access,offline" -c "http://localhost:4200,http://localhost:4200/" --post-logout-callbacks http://localhost:4200 --token-endpoint-auth-method "none"


#. Edit the ``ttl`` section in ``hydra.yml`` and/or ``hydra.prod.yml``\ :

.. code-block:: yml

   ttl:
     login_consent_request: 1h
     access_token: 8760h
     id_token: 8760h
     refresh_token: -1
     auth_code: 8760h

#. Edit ``globalconfig.json`` in the ``Korp.Legacy.Authentication`` service like so:

Before

.. code-block:: json

   // ...
   "ViasoftLegacyAuthenticationHydra": {
     "HydraAllowedScopes": "[\"openid\", \"profile\", \"offline\"]"
   },
   // ...

After

.. code-block:: json

   // ...
   "ViasoftLegacyAuthenticationHydra": {
     "HydraAllowedScopes": "[\"openid\", \"profile\", \"offline\", \"offline_access\"]"
   },
   // ...

#. Restart Hydra
#. Restart ``Korp.Legacy.Authentication``

----

5.5.1 (07/06/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1697 <http://jira.korp.com.br/browse/FRM-1697>`_ - ``grid``\ : New Chromium version caused grid rows to expand to fill the available vertical space.

----

5.5.0 (01/06/2021)
------------------

Breaking changes
^^^^^^^^^^^^^^^^

* `FRM-1574 <http://jira.korp.com.br/browse/FRM-1574>`_ - ``grid``\ , ``tree-table``\ : The ``persistentCache`` option now defaults to ``false``.

Features
^^^^^^^^

* `FRM-1454 <http://jira.korp.com.br/browse/FRM-1454>`_ - ``button``\ : Added icon options to buttons with ``model="icon"``.

  * You can now use the ``iconStyle``\ , ``iconColor`` and ``iconBoxColor`` properties in ``vs-button`` elements.

* `FRM-1504 <http://jira.korp.com.br/browse/FRM-1504>`_ - ``grid``\ : Added icon options to grid actions.

  * You can now use the ``iconStyle``\ , ``iconColor`` and ``iconBoxColor`` properties in ``VsGridAction`` objects.

* `FRM-1537 <http://jira.korp.com.br/browse/FRM-1537>`_ - ``i18n``\ : The ``TranslateService.instant`` method now works with pipe parameters.
* `FRM-1588 <http://jira.korp.com.br/browse/FRM-1588>`_ - ``grid``\ : Added an error message and reload button that are shown automatically when a get request fails.
* `FRM-1599 <http://jira.korp.com.br/browse/FRM-11599>`_ - ``filter``\ : MongoDB queries are now case-insensitive. This applies to ``autocomplete``\ , ``grid`` and ``tree-table``\ , as well as anyone using the ``getMongoFromJQuery`` function.

Bug Fixes
^^^^^^^^^

* `FRM-1562 <http://jira.korp.com.br/browse/FRM-1562>`_ - ``navigation``\ : User profile picture was being "squeezed".
* `FRM-1607 <http://jira.korp.com.br/browse/FRM-1607>`_ - ``select-modal-legacy``\ : Styles from ``select-modal`` could override styles from ``select-modal-legacy``\ , causing the grid to have 0 height.
* `FRM-1603 <http://jira.korp.com.br/browse/FRM-1603>`_ - ``http``\ : Environments with accent marks could cause requests to fail.

  * ``EnvironmentName`` and ``AppName`` request headers were removed since they're unused and could cause these issues.
  * For identifying environments, the ``EnvironmentId`` header should be used instead.

Housekeeping
^^^^^^^^^^^^

* `FRM-1563 <http://jira.korp.com.br/browse/FRM-1563>`_\ : Removed all internal usages of SerialSubscriptions and SerialUnsubscriber.
* `FRM-1272 <http://jira.korp.com.br/browse/FRM-1272>`_\ : Organized and cleaned up all internal imports.
* `FRM-1661 <http://jira.korp.com.br/browse/FRM-1661>`_\ : Grid now uses VsSubscriptionManager, fixing a **huge performance** issue which caused that subscriptions wasn't removed until the ngOnDestroy of vs-grid component.

----

5.4.2 (07/06/2021)
------------------

Bug Fixes
^^^^^^^^^

* `FRM-1697 <http://jira.korp.com.br/browse/FRM-1697>`_ - ``grid``\ : New Chromium version caused grid rows to expand to fill the available vertical space.

----

5.4.1 (16/02/2021)
------------------

Breaking Changes
^^^^^^^^^^^^^^^^

* `FRM-1560 <http://jira.korp.com.br/browse/FRM-1560>`_ - ``data-lively``\ : The ``identifier`` property in ``DataLivelyUpdate`` has been reverted back to ``uniqueTypeName``.

Bug Fixes
^^^^^^^^^

* `FRM-1557 <http://jira.korp.com.br/browse/FRM-1557>`_ - ``search-input``\ : Icons were being stacked vertically instead of horizontally.

----

5.4.0 (08/02/2021)
------------------

Summary
^^^^^^^

This release brings more QOL improvements and long overdue features and bug fixes. The Dashboard package is no longer included in the core SDK repository and will no longer have its updates listed on this changelog moving forward.

Breaking changes
^^^^^^^^^^^^^^^^

* `FRM-1514 <http://jira.korp.com.br/browse/FRM-1514>`_ - ``dashboard``\ : Removed the Dashboard package from the core SDK repository.

  * It will continue to be distributed under the ``@viasoft/dashboard`` package on ProGet, but will no longer follow the same update schedule as other core SDK packages. The first version published will be ``5.5.0``.

* `FRM-1445 <http://jira.korp.com.br/browse/FRM-1445>`_ - ``app-core``\ , ``message-dialog``\ : ``VsAppCoreModule`` now imports ``VsMessageDialogModule`` automatically.

  * ``VsMessageDialogModule`` now prevents itself from being initialized more than once, but you should still remove any others imports you might have in your app.
  * You should also be using ``VsAppCoreModule.forRoot()`` instead of ``VsCommonModule.forRoot()``\ , as it is now stable and can be safely used.

* `FRM-1444 <http://jira.korp.com.br/browse/FRM-1444>`_ - ``data-lively``\ : Refactored VsDataLivelyService to use ``Subject``.

  * Instead of using ``subscribeToUpdate`` and callbacks, you should now use the ``get`` method, which returns a ``Subject``.
  * If the ``Subject`` doesn't exist, it will be created automatically.
  * The ``uniqueTypeName`` property in ``DataLivelyUpdate`` has been renamed to ``identifier``.

Features
^^^^^^^^

* `FRM-1520 <http://jira.korp.com.br/browse/FRM-1520>`_ - ``http``\ , ``common``\ , ``error-monitoring``\ : Added support for Organization Units and Environments.

  * Environment data can be retrieved from ``VsJwtProviderService`` and will automatically be sent in request headers and Sentry tags.

* `FRM-1534 <http://jira.korp.com.br/browse/FRM-1534>`_ - ``navigation``\ : Added option to disable page reloading when the selected company changes.

  * You can toggle this by providing the ``DISABLE_RELOAD_ON_COMPANY_CHANGE`` injection token.

* `FRM-1410 <http://jira.korp.com.br/browse/FRM-1410>`_ - ``button``\ : Now emits an Event object in the ``clickEvent`` output.
* `FRM-1443 <http://jira.korp.com.br/browse/FRM-1443>`_ - ``common``\ : Added ``VsSubscriptionManager`` helper class.

  * Deprecated ``SerialSubscriptions`` class and ``SerialUnsubscriber`` function.
  * Use ``VsSubscriptionManager.add()`` to add a new subscription. If a subscription with the same name already exists and is open, it will be replaced by a new one.
  * Inside ``ngOnDestroy``\ , always call ``VsSubscriptionManager.clear()``.

* `FRM-1450 <http://jira.korp.com.br/browse/FRM-1450>`_ - ``client``\ : Added support for selective generation.

  * You're now able to pick which parts of your API you'd like to generate.

* `FRM-1455 <http://jira.korp.com.br/browse/FRM-1455>`_ - ``button``\ : Button will now switch to ``model="icon"`` automatically if the ``icon`` attribute is set.
* `FRM-1507 <http://jira.korp.com.br/browse/FRM-1507>`_ - ``form``\ : Adjusted styles for ``vs-checkbox``\ , ``vs-search``\ , ``vs-button`` and ``vs-select`` components.

  * You can also use the ``form-align-left``\ , ``form-align-center``\ , ``form-align-right`` and ``form-full-width`` attributes on a ``vs-button`` to change its alignment or sizing.

Changes
^^^^^^^

* `FRM-1512 <http://jira.korp.com.br/browse/FRM-1512>`_ - ``filter``\ : Filter overlay will now close on scroll.

Bug Fixes
^^^^^^^^^

* `FRM-1424 <http://jira.korp.com.br/browse/FRM-1424>`_ - ``grid``\ : Disabling actions column would break card mode.
* `FRM-1419 <http://jira.korp.com.br/browse/FRM-1419>`_ - ``grid``\ : Pagination would be incorrect after applying a filter in some cases.
* `FRM-1446 <http://jira.korp.com.br/browse/FRM-1446>`_ - ``grid``\ : Progress bar column had incorrect filter settings by default.
* `FRM-1380 <http://jira.korp.com.br/browse/FRM-1380>`_ - ``filter``\ : Date filter wouldn't be restored correctly after being cached.
* `FRM-1475 <http://jira.korp.com.br/browse/FRM-1475>`_ - ``search-input``\ : "Search" and "clear" buttons were sized incorrectly.
* `FRM-1511 <http://jira.korp.com.br/browse/FRM-1511>`_ - ``client``\ : An incorrect summary would sometimes display before the API was actually generated.
* `FRM-1540 <http://jira.korp.com.br/browse/FRM-1540>`_ - ``grid``\ : Paginator dropdown wouldn't show up on mobile.

----

5.3.0 (23/12/2020)
------------------

Summary
^^^^^^^

This release adds the Quick Filter functionality, more navigation customization options, swapping core SDK services functionality, as well as small QOL changes and bug fixes.

Breaking changes
^^^^^^^^^^^^^^^^

* `FRM-1469 <http://jira.korp.com.br/browse/FRM-1469>`_\ : Removed ``BrowserModule`` and ``BrowserAnimationsModule`` imports inside SDK, these modules now have to be imported inside of your app's ``AppModule``.
* `FRM-1484 <http://jira.korp.com.br/browse/FRM-1484>`_ - ``error-monitoring``\ : Replaced ``sentryDsn`` with ``sentrySettings``\ , now allowing for a Sentry environment to be defined.

Features
^^^^^^^^

* `FRM-102 <http://jira.korp.com.br/browse/FRM-102>`_ - ``grid``\ : Added Quick Filters to grid.
* `FRM-1433 <http://jira.korp.com.br/browse/FRM-1433>`_\ , `FRM-1437 <http://jira.korp.com.br/browse/FRM-1437>`_ - ``http``\ : Error dialog will now be shown when certain HTTP errors happen and ``VS_UI_ERROR_SETTINGS`` can be used to configure this behavior.
* `FRM-1435 <http://jira.korp.com.br/browse/FRM-1435>`_ - ``grid``\ : Added ``elastic-search`` and ``elastic-search-scored`` filter types.
* `FRM-1463 <http://jira.korp.com.br/browse/FRM-1463>`_ - ``dashboard``\ : Added ``onTabSelected`` event, which fires when a tab is selected.
* `FRM-1457 <http://jira.korp.com.br/browse/FRM-1457>`_ - ``navigation``\ : Added ``navConfig`` property to ``VsCommonModule`` and ``VsAppCoreModule`` forRoot, allowing for customization of the navigation top bar.
* `FRM-1468 <http://jira.korp.com.br/browse/FRM-1468>`_\ , `FRM-1459 <http://jira.korp.com.br/browse/FRM-1459>`_ - ``common``\ : Added ``customServices`` property which allows swapping out core SDK services for custom ones.
* `FRM-1462 <http://jira.korp.com.br/browse/FRM-1462>`_\ , `FRM-1477 <http://jira.korp.com.br/browse/FRM-1477>`_ - ``http``\ : Added ``VsHttpModule.forRoot`` which allows for custom services, in order to support Hydra logins.

Changes
^^^^^^^

* `FRM-1439 <http://jira.korp.com.br/browse/FRM-1439>`_ - ``select-modal``\ , ``select-modal-legacy``\ : Search field will now be focused automatically.
* `FRM-1458 <http://jira.korp.com.br/browse/FRM-1458>`_ - ``navigation``\ : Search bar will now show as an icon on mobile devices.
* `FRM-1483 <http://jira.korp.com.br/browse/FRM-1483>`_ - ``common``\ : HTTPS is now never required.
* `FRM-1479 <http://jira.korp.com.br/browse/FRM-1479>`_ - ``notification``\ : Added time suffix.

Bug Fixes
^^^^^^^^^

* `FRM-1423 <http://jira.korp.com.br/browse/FRM-1423>`_ - ``grid``\ : Data wasn't being loaded when grid started in card mode.
* `FRM-1467 <http://jira.korp.com.br/browse/FRM-1467>`_ - ``notification``\ : New notification message was not translated properly
* `FRM-1470 <http://jira.korp.com.br/browse/FRM-1470>`_ - ``dashboard``\ : When trying to delete a dashboard, the last one on the list was always being deleted instead.

----

5.2.0 (28/08/2020)
------------------

This release focuses mainly on bug fixes and small QOL changes.

Dependency updates
^^^^^^^^^^^^^^^^^^

``dependencies``
~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @fortawesome/fontawesome-pro
     - 🔄 Updated
     - ``^5.14.0``


* `FRM-931 <http://jira.korp.com.br/browse/FRM-931>`_\ : FontAwesome updated to ``5.14``.

Changes
^^^^^^^

* `FRM-1377 <http://jira.korp.com.br/browse/FRM-1377>`_\ : Removed deprecated date formats and added Angular Date Pipe compatible formats.

Bug Fixes
^^^^^^^^^

* `FRM-737 <http://jira.korp.com.br/browse/FRM-737>`_ - ``notification``\ : Notification snackbar wasn't properly translated.
* `FRM-794 <http://jira.korp.com.br/browse/FRM-794>`_ - ``button``\ : ``color`` property wasn't working properly.
* `FRM-816 <http://jira.korp.com.br/browse/FRM-816>`_ - ``tab-group``\ : Tab label wouldn't show a title if a plain string was used.
* `FRM-850 <http://jira.korp.com.br/browse/FRM-850>`_ - ``grid``\ : Paginator dropdown would open to the bottom when grid was less than ``650px`` tall, causing an overflow.
* `FRM-1003 <http://jira.korp.com.br/browse/FRM-1003>`_ - ``autocomplete``\ : Removing a chip wouldn't mark as dirty.
* `FRM-1038 <http://jira.korp.com.br/browse/FRM-1038>`_ - ``grid``\ : Translations in card mode weren't working.
* `FRM-1154 <http://jira.korp.com.br/browse/FRM-1154>`_ - ``navigation``\ : Expanding a group would navigate to the home page.
* `FRM-1214 <http://jira.korp.com.br/browse/FRM-1214>`_ - ``client``\ : Paths with a space would stop the client from being generated properly.
* `FRM-1342 <http://jira.korp.com.br/browse/FRM-1342>`_ - ``tree-table``\ : Horizontal scroll bar would appear if a tag column was placed on the last position.
* `FRM-1344 <http://jira.korp.com.br/browse/FRM-1344>`_ - ``navigation``\ : Current page indicator would go away when hovering.
* `FRM-1378 <http://jira.korp.com.br/browse/FRM-1378>`_ - ``grid``\ : Grid wouldn't load after applying a filter and reloading when cache was turned on.

----

5.1.0 (21/08/2020)
------------------

This release brings Sentry error monitoring to all apps. More information can be found `here <https://viasoftfrontend.korp.com.br/pt/master/error-monitoring/setup/>`_.

Breaking changes
^^^^^^^^^^^^^^^^

* `FRM-1099 <http://jira.korp.com.br/browse/FRM-1099>`_\ : Environment property ``test`` renamed to ``mock``. We suggest you also update your project so that ``environment.test.ts`` becomes ``environment.mock.ts`` and ``--configuration=test`` becomes ``--configuration=mock``.

Dependency updates
^^^^^^^^^^^^^^^^^^

``dependencies``
~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @sentry/browser
     - ✅ Added
     - ``^5.21.1``

Features
^^^^^^^^

* `FRM-1360 <http://jira.korp.com.br/browse/FRM-1360>`_ - ``error-monitoring``\ : Implemented error monitoring using Sentry.
* `FRM-1368 <http://jira.korp.com.br/browse/FRM-1368>`_ - ``view-template``\ : Actions area will now correctly apply styles to a ``vs-button`` inside another component.

  * If you have more than one level of nesting, you might need to use the ``.vs-header-action`` class.
  * You can also disable this behaviour using the ``.disable-action-style`` class.

* `FRM-1372 <http://jira.korp.com.br/browse/FRM-1365>`_\ , `FRM-1365 <http://jira.korp.com.br/browse/FRM-1365>`_ - ``grid``\ : You can now align a grid column's title and contents to the left, right or center.
* `FRM-375 <http://jira.korp.com.br/browse/FRM-375>`_ - ``grid``\ : Added option to not fetch any data until the user requests it.
* `FRM-379 <http://jira.korp.com.br/browse/FRM-379>`_ - ``grid``\ : Added option to show total count.
* `FRM-479 <http://jira.korp.com.br/browse/FRM-479>`_ - ``grid``\ : Added options to disable column resizing and/or column reordering.
* `FRM-1300 <http://jira.korp.com.br/browse/FRM-1300>`_\ , `FRM-1301 <http://jira.korp.com.br/browse/FRM-1301>`_ - ``grid``\ , ``tree-table``\ : Added option to discard cached state when columns have changed.

Changes
^^^^^^^

* `FRM-1372 <http://jira.korp.com.br/browse/FRM-1372>`_ - ``grid``\ , ``tree-table``\ : Checkbox/boolean columns are now center-aligned.

Bug Fixes
^^^^^^^^^

* `FRM-1366 <http://jira.korp.com.br/browse/FRM-1366>`_ - ``filter``\ : Date filter couldn't be cleared.
* `FRM-796 <http://jira.korp.com.br/browse/FRM-796>`_ - ``spinner``\ : Overflow would create scrollbars when spinning.
* `FRM-861 <http://jira.korp.com.br/browse/FRM-861>`_ - ``grid``\ : "See more/less" button would select the item when in card (mobile) mode.
* `FRM-501 <http://jira.korp.com.br/browse/FRM-501>`_ - ``grid``\ : Actions column would disappear after toggling ``*ngIf``.
* `FRM-988 <http://jira.korp.com.br/browse/FRM-988>`_ - ``grid``\ : Checkbox would set its value to ``null`` after toggling.

----

5.0.1 (13/08/2020)
------------------

Breaking changes
^^^^^^^^^^^^^^^^

``dependencies``
~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - @asymmetrik/ngx-leaflet
     - 🔄 Updated
     - ``^7.0.1``
   * - leaflet
     - 🔄 Updated
     - ``^1.6.0``

If you're still experiencing issues when running ``ngcc``\ , delete your ``package-lock.json`` file and try again.

Bug Fixes
^^^^^^^^^

``components > map``
~~~~~~~~~~~~~~~~~~~~~~~~

* `FRM-1369 <http://jira.korp.com.br/browse/FRM-1369>`_\ : Fixed error when running ``ngcc``.

----

5.0.0 (10/08/2020)
------------------

This update brings SDK Frontend to Angular version 9. It is crucial that you follow these steps in this exact order when updating your apps and libraries.

Update guide
^^^^^^^^^^^^

Sync your dependencies
~~~~~~~~~~~~~~~~~~~~~~

Update, remove or add the following dependencies to your ``package.json`` file:

``dependencies``
""""""""""""""""""""

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - hammerjs
     - ❌ Removed
     - 
   * - ngx-currency
     - ❌ Removed
     - 
   * - ngx-mask
     - ❌ Removed
     - 
   * - angular2-query-builder
     - 🔄 Updated
     - ``^0.6.2``
   * - @viasoft/app-core
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/client
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/client-core
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/common
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/components
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/dashboard
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/http
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/navigation
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/theme
     - 🔄 Updated
     - ``5.0.0``
   * - @viasoft/view-template
     - 🔄 Updated
     - ``5.0.0``
   * - primeng
     - 🔄 Updated
     - ``^9.1.3``
   * - primeicons
     - 🔄 Updated
     - ``^2.0.0``
   * - single-spa-angular
     - 🔄 Updated
     - ``^4.3.1``
   * - single-spa
     - ✅ Added
     - ``^5.5.5``


``devDependencies``
"""""""""""""""""""""""

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - tsickle
     - 🔄 Updated
     - ``^0.38.1``

*Note: ``tsickle`` might be present in your ``dependencies`` instead of ``devDependencies``. If that's the case, please move it.*

Install dependencies
~~~~~~~~~~~~~~~~~~~~

Delete your ``dist`` and ``node_modules`` folder(s), then, run ``npm i``. Commit your changes, along with ``package.json``.

Run Angular migrations
~~~~~~~~~~~~~~~~~~~~~~

Run the following command:

.. code-block:: shell

   ng update @angular/core@9 @angular/cli@9 @angular/material@9 -C

*Note: the ``-C`` flag will automatically commit each step of the migration for you. We highly recommend using it.*

If you encounter any issues during this step and/or want more information about the migration, visit the `Angular Update Guide website <https://update.angular.io/#8.2:9.1l3>`_.

Fix your code
~~~~~~~~~~~~~

There are a couple things that need to be fixed manually.

``main.ts``
"""""""""""""""

The following line can be removed from this file:

.. code-block:: ts

   import 'hammerjs';

``main.single-spa.ts``
""""""""""""""""""""""""""

Besides removing ``hammerjs``\ , you must also replace the following import:

.. code-block:: ts

   // Old
   import singleSpaAngular, { getSingleSpaExtraProviders } from 'single-spa-angular';

   // New
   import { singleSpaAngular, getSingleSpaExtraProviders } from 'single-spa-angular';

And perform the following change:

.. code-block:: ts

   const lifecycles = singleSpaAngular({
     bootstrapFunction: singleSpaProps => {
       singleSpaPropsSubject.next(singleSpaProps);
       return initAppSettings(environment, true)
         .then(() => {
           return platformBrowserDynamic(getSingleSpaExtraProviders()) // Make sure getSingleSpaExtraProviders() is here
             .bootstrapModule(AppModule)
             .catch(err => console.error(err)); // Remove this line
             .catch(err => { throw err }); // And add this one
         });
     },
     // ...
   });

``tsconfig.app.json``
"""""""""""""""""""""""""

Add ``"main.single-spa.ts"`` to the ``include`` section:

.. code-block:: json

   {
     // ...
     "include": [
       // ...
       "main.single-spa.ts"
     ]
   }

Add the ``postinstall`` script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In your ``package.json`` file, add the following to your ``scripts``\ :

.. code-block:: json

   {
     // ...
     "scripts": {
       // ...
       "postinstall": "ngcc"
     }
   }

This will run the Angular Compatibility Compiler right after installing any packages, which is required in Angular 9 for Ivy apps (default). You may be tempted to remove this script, but it will run before serving your application if you do. We highly recommend keeping it to avoid any issues and speed up serve time.

Add the ``--prod`` flag to your library builds
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you have any Angular Libraries in your repository, you'll need to add the ``--prod`` flag to their build. This will disable Ivy which is required for libraries. Libraries build without this flag will not cause any errors during normal usage but ``npm`` will *not* allow you to publish them.

In case you had any issues during the migration and the ``--prod`` flag does not work, you can add a ``tsconfig.lib.prod.json`` file to the root of your library with the following content:

.. code-block:: json

   {
     "extends": "./tsconfig.lib.json",
     "angularCompilerOptions": {
       "enableIvy": false
     }
   }

About AOT and Ivy
~~~~~~~~~~~~~~~~~

We highly recommend keeping Ivy and AOT turned on for your apps and libraries. AOT in Angular 9 does not have any impact on performance (it might be even faster) and it helps figure out any errors you might have and avoid surprises during your builds. Further information about AOT and Ivy can be found in the Angular Documentation.

Known issues
~~~~~~~~~~~~

You might notice errors about ``angular2-query-builder`` when running ``ngcc``. If you're running version ``^0.6.2``\ , you can safely ignore these arrors as they won't affect anything.
