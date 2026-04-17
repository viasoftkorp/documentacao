.. _changelog-email:

Changelog - Email
=================

This changelog refers to the ``@viasoft/email`` library.

8.0.0 (27/05/2024)
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
     - ``^17.3.10``
     - `angular/animations <https://github.com/angular/angular#readme>`_
   * - @angular/cdk
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/cdk <https://github.com/angular/components#readme>`_
   * - @angular/common
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/common <https://github.com/angular/angular#readme>`_
   * - @angular/compiler
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/compiler <https://github.com/angular/angular#readme>`_
   * - @angular/core
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/core <https://github.com/angular/angular#readme>`_
   * - @angular/forms
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/forms <https://github.com/angular/angular#readme>`_
   * - @angular/material
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/material <https://github.com/angular/components#readme>`_
   * - @angular/platform-browser
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/platform-browser <https://github.com/angular/angular#readme>`_
   * - @angular/platform-browser-dynamic
     - 🔃 Updated
     - ``^17.3.10``
     - `angular/platform-browser <https://github.com/angular/angular#readme>`_
   * - @angular/router
     - 🔃 Updated
     - ``^17.3.10``
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
     - ``8.0.0-beta.15``
     - `viasoft/app-core <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/app-core/versions>`_
   * - @viasoft/client-core
     - 🔃 Updated
     - ``8.0.0-beta.15``
     - `viasoft/client-core <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/client-core/versions>`_
   * - @viasoft/common
     - 🔃 Updated
     - ``8.0.0-beta.15``
     - `viasoft/common <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/common/versions>`_
   * - @viasoft/components
     - 🔃 Updated
     - ``8.0.0-beta.15``
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
     - ``8.0.0-beta.15``
     - `viasoft/http <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/http/versions>`_
   * - @viasoft/navigation
     - 🔃 Updated
     - ``8.0.0-beta.15``
     - `viasoft/navigation <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/navigation/versions>`_
   * - @viasoft/text-editor
     - 🔃 Updated
     - ``8.0.0``
     - `viasoft/text-editor <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/text-editor/versions>`_
   * - @viasoft/theming
     - 🔃 Updated
     - ``8.0.0-beta.15``
     - `viasoft/theming <https://proget.korp.com.br/feeds/viasoft-sdk-frontend/@viasoft/theming/versions>`_
   * - @viasoft/view-template
     - 🔃 Updated
     - ``8.0.0-beta.15``
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
     - ``~3.37.1``
     - `core-js <https://github.com/zloirock/core-js>`_
   * - dompurify
     - 🔃 Updated
     - ``~3.1.4``
     - `dompurify <https://www.npmjs.com/package/dompurify>`_
   * - imask
     - 🔃 Updated
     - ``~7.6.0``
     - `imask <https://imask.js.org/guide.html>`_
   * - jwt-decode
     - 🔃 Updated
     - ``^4.0.0``
     - `jwt-decode <https://github.com/auth0/jwt-decode#readme>`_
   * - lodash
     - ✅ Added
     - ``^4.17.21``
     - `lodash <https://lodash.com/docs/4.17.15>`_
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
     - ``^2.0.2``
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
   * - ua-parser-js
     - 🔃 Updated
     - ``~1.0.37``
     - `ua-parser-js <https://github.com/faisalman/ua-parser-js>`_
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
   * - @angular-builders/custom-webpack
     - 🔄 Updated
     - ``~17.0.2``
     - `angular-builders/custom-webpack <https://github.com/just-jeb/angular-builders#readme>`_
   * - @angular-devkit/build-angular
     - 🔄 Updated
     - ``^17.3.8``
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
     - ``^17.3.10``
     - `angular/cli <https://github.com/angular/angular-cli>`_
   * - @angular/compiler-cli
     - 🔄 Updated
     - ``^17.3.10``
     - `angular/compiler-cli <https://github.com/angular/angular/tree/main/packages/compiler-cli>`_
   * - @angular/language-service
     - 🔄 Updated
     - ``^17.3.10``
     - `angular/language-service <https://github.com/angular/angular#readme>`_
   * - @types/jasmine
     - 🔄 Updated
     - ``~5.1.4``
     - `types/jasmine <https://github.com/DefinitelyTyped/DefinitelyTyped/>`_
   * - @types/jasminewd2
     - ❌ Removed
     -
     -
   * - @types/lodash
     - ✅ Added
     - ``^4.17.4``
     - `types/lodash <https://github.com/DefinitelyTyped/DefinitelyTyped/>`_
   * - @types/node
     - 🔄 Updated
     - ``~20.12.12``
     - `types/node <https://github.com/DefinitelyTyped/DefinitelyTyped>`_
   * - @types/ua-parser-js
     - 🔄 Updated
     - ``^0.7.39``
     - `@types/ua-parser-js <https://github.com/DefinitelyTyped/DefinitelyTyped>`_
   * - jasmine-core
     - 🔄 Updated
     - ``~5.1.2``
     - `jasmine-core <https://github.com/jasmine/jasmine/>`_
   * - jasmine-spec-reporter
     - 🔄 Updated
     - ``~7.0.0``
     - `jasmine-spec-reporter <https://github.com/bcaudan/jasmine-spec-reporter>`_
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
   * - protractor
     - ❌ Removed
     -
     -
   * - typescript
     - 🔄 Updated
     - ``~5.4.5``
     - `typescript <https://www.typescriptlang.org/>`_

____

6.1.0 (08/11/2021)
------------------

Dependency updates
^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1

   * - Dependency
     - Status
     - Version
   * - ``@viasoft/app-core``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/client``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/client-core``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/common``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/components``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/http``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/navigation``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/theming``
     - 🔃 Updated
     - ``6.3.4``
   * - ``@viasoft/view-template``
     - 🔃 Updated
     - ``6.3.4``


Breaking changes
^^^^^^^^^^^^^^^^


* `FRM-1804 <http://jira.korp.com.br/browse/FRM-1804>`_\ :

  * Removed ``VS_EMAIL_BASE_SUFFIX`` and replaced its usages with ``VS_API_PREFIX``\ ;
  * Removed ``EmailSenderData.separateMultipleEmails``\ ;
  * Removed ``VS_EMAIL_RESOLVE_ENDPOINT_FUNCTION``\ ;
  * Added ``multipleEmailsEndpoint``

    * Can be used for defining a custom endpoint to be used when sending multiple e-mails, serving the same purpose ``EmailSenderData.separateMultipleEmails`` and ``VS_EMAIL_RESOLVE_ENDPOINT_FUNCTION`` had before.
