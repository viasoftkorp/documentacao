.. _changelog-text-editor:

Changelog - Text Editor
====================================

This changelog refers to the ``@viasoft/text-editor`` library.

8.0.0 (22/05/2024)
------------------

This release is focused around updating to Angular 17.

To update to version 8.0.0, follow the `SDK Core documentation <#7.0.0-beta.1>`_ and address any potential breaking changes in the SDK Core packages.

Dependency updates
^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
     - Documentation
   * - @angular/animations
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/animations <https://github.com/angular/angular#readme>`_
   * - @angular/cdk
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/cdk <https://github.com/angular/components#readme>`_
   * - @angular/common
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/common <https://github.com/angular/angular#readme>`_
   * - @angular/compiler
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/compiler <https://github.com/angular/angular#readme>`_
   * - @angular/core
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/core <https://github.com/angular/angular#readme>`_
   * - @angular/forms
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/forms <https://github.com/angular/angular#readme>`_
   * - @angular/material
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/material <https://github.com/angular/components#readme>`_
   * - @angular/platform-browser
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/platform-browser <https://github.com/angular/angular#readme>`_
   * - @angular/platform-browser-dynamic
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/platform-browser <https://github.com/angular/angular#readme>`_
   * - @angular/router
     - 🔃 Updated
     - ``^17.3.9``
     - `angular/router <https://github.com/angular/angular/tree/main/packages/router>`_
   * - @fortawesome/fontawesome-pro
     - ❌ Removed
     -
     -
   * - @microsoft/signalr
     - 🔃 Updated
     - ``~8.0.0``
     - `microsoft/signalr <https://learn.microsoft.com/en-us/aspnet/core/release-notes/aspnetcore-7.0?view=aspnetcore-7.0>`_
   * - @ngx-translate/core
     - 🔃 Updated
     - ``~15.0.0``
     - `ngx-translate/core <https://github.com/ngx-translate/core/blob/master/README.md>`_
   * - @sentry/angular-ivy
     - ✅ Added
     - ``~7.114.0``
     - `sentry/angular-ivy <https://docs.sentry.io/platforms/javascript/guides/angular/>`_
   * - @sentry/browser
     - 🔃 Updated
     - ``~7.114.0``
     - `sentry/browser <https://docs.sentry.io/platforms/javascript/guides/angular/>`_
   * - @viasoft/app-core
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/app-core <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/app-core/versions>`_
   * - @viasoft/client-core
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/client-core <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/client-core/versions>`_
   * - @viasoft/common
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/common <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/common/versions>`_
   * - @viasoft/components
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/components <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/components/versions>`_
   * - @viasoft/datepicker
     - 🔃 Updated
     - ``3.0.1``
     - `viasoft/datepicker <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/datepicker/versions>`_
   * - @viasoft/fontawesome-pro
     - ✅ Added
     - ``6.4.3``
     - `viasoft/fontawesome-pro <link>`_
   * - @viasoft/http
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/http <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/http/versions>`_
   * - @viasoft/navigation
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/navigation <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/navigation/versions>`_
   * - @viasoft/theming
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/theming <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/theming/versions>`_
   * - @viasoft/view-template
     - 🔃 Updated
     - ``8.0.0-beta.12``
     - `viasoft/view-template <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/view-template/versions>`_
   * - angular-imask
     - 🔃 Updated
     - ``~7.6.0``
     - `angular-imask <https://github.com/uNmAnNeR/imaskjs/tree/master/packages/angular-imask>`_
   * - angular-oauth2-oidc
     - 🔃 Updated
     - ``~17.0.2``
     - `angular-oauth2-oidc <https://manfredsteyer.github.io/angular-oauth2-oidc/docs/>`_
   * - core-js
     - 🔃 Updated
     - ``~3.37.0``
     - `core-js <https://github.com/zloirock/core-js>`_
   * - dompurify
     - 🔃 Updated
     - ``~3.1.2``
     - `dompurify <https://www.npmjs.com/package/dompurify>`_
   * - imask
     - 🔃 Updated
     - ``~7.6.0``
     - `imask <https://imask.js.org/guide.html>`_
   * - jwt-decode
     - 🔃 Updated
     - ``^4.0.0``
     - `jwt-decode <https://github.com/auth0/jwt-decode#readme>`_
   * - ngx-quill
     - 🔃 Updated
     - ``~25.3.2``
     - `ngx-quill <https://github.com/KillerCodeMonkey/ngx-quill?tab=readme-ov-file#readme>`_
   * - primeicons
     - 🔃 Updated
     - ``~7.0.0``
     - `primeicons <https://www.primefaces.org/diamond/icons.xhtml>`_
   * - primeng
     - 🔃 Updated
     - ``~17.16.1``
     - `primeng <https://primefaces.org/primeng/setup>`_
   * - quill
     - 🔃 Updated
     - ``2.0.2``
     - `quill <https://quilljs.com/docs/>`_
   * - rxjs
     - 🔃 Updated
     - ``~7.8.1``
     - `rxjs <https://rxjs.dev/guide/overview>`_
   * - single-spa
     - 🔃 Updated
     - ``^6.0.1``
     - `single-spa <https://single-spa.js.org>`_
   * - single-spa-angular
     - 🔃 Updated
     - ``^9.1.2``
     - `single-spa-angular <https://github.com/single-spa/single-spa-angular#readme>`_
   * - tslib
     - 🔃 Updated
     - ``^2.6.2``
     - `tslib <https://github.com/microsoft/tslib>`_
   * - zone.js
     - 🔃 Updated
     - ``~0.14.6``
     - `zone.js <https://www.npmjs.com/package/zone.js?activeTab=readme>`_


.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
     - Version
     - Documentation
   * - @angular-devkit/build-angular
     - 🔄 Updated
     - ``^17.3.7``
     - `angular-devkit/build-angular <https://github.com/angular/angular-cli>`_
   * - @angular-eslint/builder
     - 🔄 Updated
     - ``17.3.0``
     - `angular-eslint/builder <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/eslint-plugin
     - 🔄 Updated
     - ``17.3.0``
     - `angular-eslint/eslint-plugin <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/eslint-plugin-template
     - 🔄 Updated
     - ``17.3.0``
     - `angular-eslint/eslint-plugin-template <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/schematics
     - 🔄 Updated
     - ``17.3.0``
     - `angular-eslint/schematics <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/template-parser
     - 🔄 Updated
     - ``17.3.0``
     - `angular-eslint/template-parser <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular/cli
     - 🔄 Updated
     - ``^17.3.7``
     - `angular/cli <https://github.com/angular/angular-cli>`_
   * - @angular/compiler-cli
     - 🔄 Updated
     - ``^17.3.9``
     - `angular/compiler-cli <https://github.com/angular/angular/tree/main/packages/compiler-cli>`_
   * - @angular/language-service
     - 🔄 Updated
     - ``^17.3.9``
     - `angular/language-service <https://github.com/angular/angular#readme>`_
   * - @types/jasmine
     - 🔄 Updated
     - ``~5.1.4``
     - `types/jasmine <https://github.com/DefinitelyTyped/DefinitelyTyped/>`_
   * - @types/node
     - 🔄 Updated
     - ``~20.12.11``
     - `types/node <https://github.com/DefinitelyTyped/DefinitelyTyped>`_
   * - @typescript-eslint/eslint-plugin
     - 🔄 Updated
     - ``7.8.0``
     - `typescript-eslint/eslint-plugin <https://github.com/DefinitelyTyped/DefinitelyTyped>`_
   * - @typescript-eslint/parser
     - 🔄 Updated
     - ``7.8.0``
     - `typescript-eslint/parser <https://github.com/DefinitelyTyped/DefinitelyTyped>`_
   * - @viasoft/testing
     - 🔄 Updated
     - ``3.0.5``
     - `viasoft/testing <link>`_
   * - cypress
     - 🔄 Updated
     - ``~13.9.0``
     - `cypress <https://docs.cypress.io/guides/references/migration-guide>`_
   * - eslint-import-resolver-typescript
     - 🔄 Updated
     - ``~3.6.1``
     - `eslint-import-resolver-typescript <https://github.com/import-js/eslint-import-resolver-typescript/blob/master/README.md>`_
   * - eslint-plugin-import
     - 🔄 Updated
     - ``~2.29.1``
     - `eslint-plugin-import <https://github.com/import-js/eslint-plugin-import/blob/main/README.md>`_
   * - jasmine-core
     - 🔄 Updated
     - ``~5.1.2``
     - `jasmine-core <https://github.com/jasmine/jasmine/>`_
   * - jasmine-spec-reporter
     - ❌ Removed
     - 
     -
   * - karma
     - 🔄 Updated
     - ``~6.4.3``
     - `karma <https://karma-runner.github.io/>`_
   * - karma-chrome-launcher
     - 🔄 Updated
     - ``~3.2.0``
     - `karma-chrome-launcher <https://github.com/karma-runner/karma-chrome-launcher>`_
   * - karma-coverage-istanbul-reporter
     - ❌ Removed
     -
     -
   * - karma-coverage
     - ✅ Added
     - ``~2.2.1``
     - `karma-coverage <https://github.com/karma-runner/karma-coverage#readme>`_
   * - karma-jasmine-html-reporter
     - 🔄 Updated
     - ``~2.1.0``
     - `karma-jasmine-html-reporter <https://github.com/dfederm/karma-jasmine-html-reporter>`_
   * - ng-packagr
     - 🔄 Updated
     - ``^17.3.0``
     - `ng-packagr <https://github.com/ng-packagr/ng-packagr>`_
   * - prettier
     - 🔄 Updated
     - ``~3.2.5``
     - `prettier <https://prettier.io>`_
   * - shelljs
     - 🔄 Updated
     - ``~0.8.5``
     - `shelljs <https://github.com/shelljs/shelljs/blob/master/README.md>`_
   * - stylelint
     - 🔄 Updated
     - ``~14.16.1``
     - `stylelint <https://stylelint.io/migration-guide/to-14/>`_
   * - stylelint-config-prettier
     - 🔄 Updated
     - ``~9.0.5``
     - `stylelint-config-prettier <https://github.com/prettier/stylelint-config-prettier>`_
   * - typescript
     - 🔄 Updated
     - ``~5.4.5``
     - `typescript <https://www.typescriptlang.org/>`_


Breaking Changes
^^^^^^^^^^^^^^^^

- the `VsTextEditor` now uses the `VsFormManipulator`, resulting in the replacement of ``controlName`` with ``formControlName``.

.. raw:: html

    <span style="color: red">Before</span>

.. code-block:: html

    <vs-text-editor controlName="body"></vs-text-editor>

.. raw:: html

    <span style="color: green">After</span>

.. code-block:: html

    <vs-text-editor formControlName="body"></vs-text-editor>

____

7.0.0 (06/04/2023)
------------------

This release is focused around updating to Angular 14.

Dependency updates
^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
     - Documentation
   * - @angular/animations
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/animations <https://github.com/angular/angular#readme>`_
   * - @angular/cdk
     - 🔃 Updated
     - ``^14.2.7``
     - `angular/cdk <https://github.com/angular/components#readme>`_
   * - @angular/common
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/common <https://github.com/angular/angular#readme>`_
   * - @angular/compiler
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/compiler <https://github.com/angular/angular#readme>`_
   * - @angular/core
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/core <https://github.com/angular/angular#readme>`_
   * - @angular/forms
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/forms <https://github.com/angular/angular#readme>`_
   * - @angular/material
     - 🔃 Updated
     - ``^14.2.7``
     - `angular/material <https://github.com/angular/components#readme>`_
   * - @angular/platform-browser
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/platform-browser <https://github.com/angular/angular#readme>`_
   * - @angular/platform-browser-dynamic
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/platform-browser <https://github.com/angular/angular#readme>`_
   * - @angular/router
     - 🔃 Updated
     - ``^14.2.12``
     - `angular/router <https://github.com/angular/angular/tree/main/packages/router>`_
   * - @fortawesome/fontawesome-pro
     - 🔃 Updated
     - ``~6.2.1`` 
     - `fortawesome <https://fontawesome.com/v6/docs>`_
   * - @microsoft/signalr
     - 🔃 Updated
     - ``~7.0.0``
     - `microsoft/signalr <https://learn.microsoft.com/en-us/aspnet/core/release-notes/aspnetcore-7.0?view=aspnetcore-7.0>`_
   * - @ngx-translate/core
     - 🔃 Updated
     - ``~14.0.0``
     - `ngx-translate/core <https://github.com/ngx-translate/core/blob/master/README.md>`_
   * - @sentry/browser
     - 🔃 Updated
     - ``~7.28.1``
     - `sentry/browser <https://docs.sentry.io/platforms/javascript/guides/angular/>`_
   * - @viasoft/app-core
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/app-core <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/app-core/versions/all>`_
   * - @viasoft/client
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/client <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/client/versions/all>`_
   * - @viasoft/client-core
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/client-core <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/client-core/versions/all>`_
   * - @viasoft/common
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/common <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/common/versions/all>`_
   * - @viasoft/components
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/components <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/components/versions/all>`_
   * - @viasoft/datepicker
     - 🔃 Updated
     - ``2.0.0``
     - `viasoft/datepicker <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/datepicker/versions/all>`_
   * - @viasoft/http
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/http <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/http/versions/all>`_
   * - @viasoft/navigation
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/navigation <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/navigation/versions/all>`_
   * - @viasoft/theming
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/theming <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/theming/versions/all>`_
   * - @viasoft/view-template
     - 🔃 Updated
     - ``7.0.0-beta.1``
     - `viasoft/view-template <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/view-template/versions/all>`_
   * - angular-imask
     - 🔃 Updated
     - ``~6.4.3``
     - `angular-imask <https://github.com/uNmAnNeR/imaskjs/tree/master/packages/angular-imask>`_
   * - angular-oauth2-oidc
     - 🔃 Updated
     - ``~14.0.1``
     - `angular-oauth2-oidc <https://manfredsteyer.github.io/angular-oauth2-oidc/docs/>`_
   * - core-js
     - 🔃 Updated
     - ``~3.26.1``
     - `core-js <https://github.com/zloirock/core-js>`_
   * - dateformat
     - 🔃 Updated
     - ``~5.0.3``
     - `dateformat <https://www.npmjs.com/package/dateformat>`_
   * - dompurify
     - 🔃 Updated
     - ``~2.4.1``
     - `dompurify <https://www.npmjs.com/package/dompurify>`_
   * - imask
     - 🔃 Updated
     - ``~6.4.3``
     - `imask <https://imask.js.org/guide.html>`_
   * - ngx-quill
     - 🔃 Updated
     - ``~17.1.1``
     - `ngx-quill <https://github.com/KillerCodeMonkey/ngx-quill>`_
   * - primeicons
     - 🔃 Updated
     - ``~6.0.1``
     - `primeicons <https://www.primefaces.org/diamond/icons.xhtml>`_
   * - primeng
     - 🔃 Updated
     - ``~14.2.2``
     - `primeng <https://primefaces.org/primeng/setup>`_
   * - prompts
     - 🔃 Updated
     - ``~2.4.2``
     - `prompts <https://github.com/terkelg/prompts#readme>`_
   * - rxjs
     - 🔃 Updated
     - ``~7.8.0``
     - `rxjs <https://rxjs.dev/guide/overview>`_
   * - single-spa
     - 🔃 Updated
     - ``^5.9.4``
     - `single-spa <https://single-spa.js.org>`_
   * - single-spa-angular
     - 🔃 Updated
     - ``^7.0.0``
     - `single-spa-angular <https://github.com/single-spa/single-spa-angular#readme>`_
   * - tslib
     - 🔃 Updated
     - ``~2.4.1``
     - `tslib <https://github.com/microsoft/tslib>`_
   * - util
     - 🔃 Updated
     - ``~0.12.4``
     - `util <https://github.com/browserify/node-util>`_
   * - zone.js
     - 🔃 Updated
     - ``~0.12.0``
     - `zone.js <https://www.npmjs.com/package/zone.js?activeTab=readme>`_


.. list-table::
   :header-rows: 1

   * - Dev dependency
     - Status
     - Version
     - Documentation
   * - @angular-devkit/build-angular
     - 🔄 Updated
     - ``^14.2.10``
     - `angular-devkit/build-angular <https://github.com/angular/angular-cli>`_
   * - @angular-eslint/builder
     - ✅ Added
     - ``14.4.0``
     - `angular-eslint/builder <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/eslint-plugin
     - ✅ Added
     - ``14.4.0``
     - `angular-eslint/eslint-plugin <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/eslint-plugin-template
     - ✅ Added
     - ``14.4.0``
     - `angular-eslint/eslint-plugin-template <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/schematics
     - ✅ Added
     - ``14.4.0``
     - `angular-eslint/schematics <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular-eslint/template-parser
     - ✅ Added
     - ``14.4.0``
     - `angular-eslint/template-parser <https://github.com/angular-eslint/angular-eslint#readme>`_
   * - @angular/cli
     - 🔄 Updated
     - ``^14.2.10``
     - `angular/cli <https://github.com/angular/angular-cli>`_
   * - @angular/compiler-cli
     - 🔄 Updated
     - ``^14.2.12``
     - `angular/compiler-cli <https://github.com/angular/angular/tree/main/packages/compiler-cli>`_
   * - @angular/language-service
     - 🔄 Updated
     - ``^14.2.12``
     - `angular/language-service <https://github.com/angular/angular#readme>`_
   * - @types/jasmine
     - 🔄 Updated
     - ``~4.3.1``
     - `types/jasmine <https://github.com/DefinitelyTyped/DefinitelyTyped/>`_
   * - @types/jasminewd2
     - 🔄 Updated
     - ``~2.0.10``
     - `types/jasminewd2 <https://github.com/DefinitelyTyped/DefinitelyTyped/tree/master/types/jasminewd2>`_
   * - @types/node
     - 🔄 Updated
     - ``~18.11.17``
     - `types/node <https://github.com/DefinitelyTyped/DefinitelyTyped>`_
   * - @typescript-eslint/eslint-plugin
     - 🔄 Updated
     - ``5.43.0``
     - `typescript-eslint/eslint-plugin <https://github.com/typescript-eslint/typescript-eslint#readme>`_
   * - @typescript-eslint/parser
     - 🔄 Updated
     - ``5.43.0``
     - `typescript-eslint/parser <https://github.com/typescript-eslint/typescript-eslint#readme>`_
   * - @viasoft/testing
     - 🔃 Updated
     - ``2.0.2``
     - `viasoft/testing <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/testing/versions/all>`_
   * - codelyzer
     - ❌ Removed
     - 
     - `codelyzer <https://github.com/mgechev/codelyzer#readme>`_
   * - cypress
     - 🔃 Updated
     - ``~12.2.0``
     - `cypress <https://github.com/cypress-io/cypress>`_
   * - cypress-image-snapshot
     - ❌ Removed
     - 
     - `cypress-image-snapshot <https://github.com/palmerhq/cypress-image-snapshot#readme>`_
   * - eslint
     - 🔄 Updated
     - ``^8.28.0``
     - `eslint <https://eslint.org>`_
   * - eslint-config-airbnb-base
     - 🔄 Updated
     - ``~15.0.0``
     - `eslint-config-airbnb-base <https://github.com/airbnb/javascript>`_
   * - eslint-import-resolver-typescript
     - 🔄 Updated
     - ``~3.5.2``
     - `eslint-import-resolver-typescript <https://github.com/import-js/eslint-import-resolver-typescript#readme>`_
   * - eslint-plugin-import
     - 🔄 Updated
     - ``2.27.5``
     - `eslint-plugin-import <https://github.com/import-js/eslint-plugin-import>`_
   * - jasmine-core
     - 🔄 Updated
     - ``~4.5.0``
     - `jasmine-core <https://github.com/jasmine/jasmine/>`_
   * - jasmine-spec-reporter
     - 🔄 Updated
     - ``~7.0.0``
     - `jasmine-spec-reporter <https://github.com/bcaudan/jasmine-spec-reporter>`_
   * - karma
     - 🔄 Updated
     - ``~6.4.1``
     - `karma <https://karma-runner.github.io/>`_
   * - karma-chrome-launcher
     - 🔄 Updated
     - ``~3.1.1``
     - `karma-chrome-launcher <https://github.com/karma-runner/karma-chrome-launcher>`_
   * - karma-coverage-istanbul-reporter
     - 🔄 Updated
     - ``~3.0.3``
     - `karma-coverage-istanbul <https://github.com/mattlewis92/karma-coverage-istanbul-reporter>`_
   * - karma-jasmine
     - 🔄 Updated
     - ``~5.1.0``
     - `karma-jasmine <https://github.com/karma-runner/karma-jasmine>`_
   * - karma-jasmine-html-reporter
     - 🔄 Updated
     - ``~2.0.0``
     - `karma-jasmine-html-reporter <https://github.com/dfederm/karma-jasmine-html-reporter>`_
   * - ng-packagr
     - 🔄 Updated
     - ``~14.2.2``
     - `ng-packagr <https://github.com/ng-packagr/ng-packagr>`_
   * - prettier
     - 🔄 Updated
     - ``~2.8.1``
     - `prettier <https://prettier.io>`_
   * - protractor
     - ❌ Removed
     - 
     - `protractor <https://github.com/angular/protractor>`_
   * - shelljs
     - 🔄 Updated
     - ``~0.8.5``
     - `shelljs <https://github.com/shelljs/shelljs>`_
   * - stylelint
     - 🔄 Updated
     - ``~14.16.0``
     - `stylelint <https://stylelint.io>`_
   * - stylelint-config-prettier
     - 🔄 Updated
     - ``~9.0.4``
     - `stylelint-config-prettier <https://github.com/prettier/stylelint-config-prettier#readme>`_
   * - stylelint-config-standard
     - 🔄 Updated
     - ``~29.0.0``
     - `stylelint-config-standard <https://github.com/stylelint/stylelint-config-standard#readme>`_
   * - stylelint-config-standard-scss
     - ✅ Added
     - ``^6.1.0``
     - `stylelint-config-standard-scss <https://github.com/stylelint-scss/stylelint-config-standard-scss#readme>`_
   * - stylelint-scss
     - 🔄 Updated
     - ``~4.3.0``
     - `stylelint-scss <https://github.com/stylelint-scss/stylelint-scss#readme>`_
   * - ts-node
     - 🔄 Updated
     - ``~10.9.1``
     - `ts-node <https://typestrong.org/ts-node/>`_
   * - tsickle
     - 🔄 Updated
     - ``~0.46.3``
     - `tsickle <https://github.com/angular/tsickle>`_
   * - tslint
     - ❌ Removed
     - 
     - `tslint <https://palantir.github.io/tslint>`_
   * - tslint-angular
     - ❌ Removed
     - 
     - `tslint-angular <https://github.com/mgechev/tslint-angular#readme>`_
   * - typescript
     - 🔄 Updated
     - ``~4.7.2``
     - `typescript <https://www.typescriptlang.org/>`_
   * - yargs
     - 🔄 Updated
     - ``~17.6.2``
     - `yargs <https://yargs.js.org/>`_

Breaking Changes
^^^^^^^^^^^^^^^^

* There have been breaking changes in @viasoft/testing. To handle these changes, follow the steps outlined in the :ref:`@viasoft/testing Breaking Changes section.<@viasoft/testing sdk-7.0.0-beta.1 breaking changes>`
