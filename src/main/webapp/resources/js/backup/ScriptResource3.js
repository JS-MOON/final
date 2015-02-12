// (c) 2010 CodePlex Foundation
(function() {
    function n() {
        Type._registerScript("MicrosoftAjaxWebForms.js", ["MicrosoftAjaxCore.js", "MicrosoftAjaxSerialization.js", "MicrosoftAjaxNetwork.js", "MicrosoftAjaxComponentModel.js"]);
        var n;
        Type.registerNamespace("Sys.WebForms");
        n = Sys.WebForms.BeginRequestEventArgs = function(n, t, i) {
            Sys.WebForms.BeginRequestEventArgs.initializeBase(this);
            this._request = n;
            this._postBackElement = t;
            this._updatePanelsToUpdate = i
        };
        n.prototype = {
            get_postBackElement: function() {
                return this._postBackElement
            },
            get_request: function() {
                return this._request
            },
            get_updatePanelsToUpdate: function() {
                return this._updatePanelsToUpdate ? Array.clone(this._updatePanelsToUpdate) : []
            }
        };
        n.registerClass("Sys.WebForms.BeginRequestEventArgs", Sys.EventArgs);
        n = Sys.WebForms.EndRequestEventArgs = function(n, t, i) {
            Sys.WebForms.EndRequestEventArgs.initializeBase(this);
            this._errorHandled = !1;
            this._error = n;
            this._dataItems = t || {};
            this._response = i
        };
        n.prototype = {
            get_dataItems: function() {
                return this._dataItems
            },
            get_error: function() {
                return this._error
            },
            get_errorHandled: function() {
                return this._errorHandled
            },
            set_errorHandled: function(n) {
                this._errorHandled = n
            },
            get_response: function() {
                return this._response
            }
        };
        n.registerClass("Sys.WebForms.EndRequestEventArgs", Sys.EventArgs);
        n = Sys.WebForms.InitializeRequestEventArgs = function(n, t, i) {
            Sys.WebForms.InitializeRequestEventArgs.initializeBase(this);
            this._request = n;
            this._postBackElement = t;
            this._updatePanelsToUpdate = i
        };
        n.prototype = {
            get_postBackElement: function() {
                return this._postBackElement
            },
            get_request: function() {
                return this._request
            },
            get_updatePanelsToUpdate: function() {
                return this._updatePanelsToUpdate ? Array.clone(this._updatePanelsToUpdate) : []
            },
            set_updatePanelsToUpdate: function(n) {
                this._updated = !0;
                this._updatePanelsToUpdate = n
            }
        };
        n.registerClass("Sys.WebForms.InitializeRequestEventArgs", Sys.CancelEventArgs);
        n = Sys.WebForms.PageLoadedEventArgs = function(n, t, i) {
            Sys.WebForms.PageLoadedEventArgs.initializeBase(this);
            this._panelsUpdated = n;
            this._panelsCreated = t;
            this._dataItems = i || {}
        };
        n.prototype = {
            get_dataItems: function() {
                return this._dataItems
            },
            get_panelsCreated: function() {
                return this._panelsCreated
            },
            get_panelsUpdated: function() {
                return this._panelsUpdated
            }
        };
        n.registerClass("Sys.WebForms.PageLoadedEventArgs", Sys.EventArgs);
        n = Sys.WebForms.PageLoadingEventArgs = function(n, t, i) {
            Sys.WebForms.PageLoadingEventArgs.initializeBase(this);
            this._panelsUpdating = n;
            this._panelsDeleting = t;
            this._dataItems = i || {}
        };
        n.prototype = {
            get_dataItems: function() {
                return this._dataItems
            },
            get_panelsDeleting: function() {
                return this._panelsDeleting
            },
            get_panelsUpdating: function() {
                return this._panelsUpdating
            }
        };
        n.registerClass("Sys.WebForms.PageLoadingEventArgs", Sys.EventArgs);
        n = Sys._ScriptLoaderTask = function(n, t) {
            this._scriptElement = n;
            this._completedCallback = t
        };
        n.prototype = {
            get_scriptElement: function() {
                return this._scriptElement
            },
            dispose: function() {
                this._disposed || (this._disposed = !0, this._removeScriptElementHandlers(), Sys._ScriptLoaderTask._clearScript(this._scriptElement), this._scriptElement = null)
            },
            execute: function() {
                this._addScriptElementHandlers();
                document.getElementsByTagName("head")[0].appendChild(this._scriptElement)
            },
            _addScriptElementHandlers: function() {
                this._scriptLoadDelegate = Function.createDelegate(this, this._scriptLoadHandler);
                document.addEventListener ? (this._scriptElement.readyState || (this._scriptElement.readyState = "loaded"), $addHandler(this._scriptElement, "load", this._scriptLoadDelegate)) : $addHandler(this._scriptElement, "readystatechange", this._scriptLoadDelegate);
                this._scriptElement.addEventListener && (this._scriptErrorDelegate = Function.createDelegate(this, this._scriptErrorHandler), this._scriptElement.addEventListener("error", this._scriptErrorDelegate, !1))
            },
            _removeScriptElementHandlers: function() {
                if (this._scriptLoadDelegate) {
                    var n = this.get_scriptElement();
                    document.addEventListener ? $removeHandler(n, "load", this._scriptLoadDelegate) : $removeHandler(n, "readystatechange", this._scriptLoadDelegate);
                    this._scriptErrorDelegate && (this._scriptElement.removeEventListener("error", this._scriptErrorDelegate, !1), this._scriptErrorDelegate = null);
                    this._scriptLoadDelegate = null
                }
            },
            _scriptErrorHandler: function() {
                this._disposed || this._completedCallback(this.get_scriptElement(), !1)
            },
            _scriptLoadHandler: function() {
                if (!this._disposed) {
                    var n = this.get_scriptElement();
                    (n.readyState === "loaded" || n.readyState === "complete") && this._completedCallback(n, !0)
                }
            }
        };
        n.registerClass("Sys._ScriptLoaderTask", null, Sys.IDisposable);
        n._clearScript = function(n) {
            Sys.Debug.isDebug || n.parentNode.removeChild(n)
        };
        n = Sys._ScriptLoader = function() {
            this._scriptsToLoad = null;
            this._sessions = [];
            this._scriptLoadedDelegate = Function.createDelegate(this, this._scriptLoadedHandler)
        };
        n.prototype = {
            dispose: function() {
                this._stopSession();
                this._loading = !1;
                this._events && delete this._events;
                this._sessions = null;
                this._currentSession = null;
                this._scriptLoadedDelegate = null
            },
            loadScripts: function(n, t, i, r) {
                var u = {
                    allScriptsLoadedCallback: t,
                    scriptLoadFailedCallback: i,
                    scriptLoadTimeoutCallback: r,
                    scriptsToLoad: this._scriptsToLoad,
                    scriptTimeout: n
                };
                this._scriptsToLoad = null;
                this._sessions.push(u);
                this._loading || this._nextSession()
            },
            queueCustomScriptTag: function(n) {
                this._scriptsToLoad || (this._scriptsToLoad = []);
                Array.add(this._scriptsToLoad, n)
            },
            queueScriptBlock: function(n) {
                this._scriptsToLoad || (this._scriptsToLoad = []);
                Array.add(this._scriptsToLoad, {
                    text: n
                })
            },
            queueScriptReference: function(n) {
                this._scriptsToLoad || (this._scriptsToLoad = []);
                Array.add(this._scriptsToLoad, {
                    src: n
                })
            },
            _createScriptElement: function(n) {
                var t = document.createElement("script"),
                    i;
                t.type = "text/javascript";
                for (i in n) t[i] = n[i];
                return t
            },
            _loadScriptsInternal: function() {
                var t = this._currentSession,
                    i, n, r;
                t.scriptsToLoad && t.scriptsToLoad.length > 0 ? (i = Array.dequeue(t.scriptsToLoad), n = this._createScriptElement(i), n.text && Sys.Browser.agent === Sys.Browser.Safari && (n.innerHTML = n.text, delete n.text), typeof i.src == "string" ? (this._currentTask = new Sys._ScriptLoaderTask(n, this._scriptLoadedDelegate), this._currentTask.execute()) : (document.getElementsByTagName("head")[0].appendChild(n), Sys._ScriptLoaderTask._clearScript(n), this._loadScriptsInternal())) : (this._stopSession(), r = t.allScriptsLoadedCallback, r && r(this), this._nextSession())
            },
            _nextSession: function() {
                if (this._sessions.length === 0) {
                    this._loading = !1;
                    this._currentSession = null;
                    return
                }
                this._loading = !0;
                var n = Array.dequeue(this._sessions);
                this._currentSession = n;
                n.scriptTimeout > 0 && (this._timeoutCookie = window.setTimeout(Function.createDelegate(this, this._scriptLoadTimeoutHandler), n.scriptTimeout * 1e3));
                this._loadScriptsInternal()
            },
            _raiseError: function() {
                var n = this._currentSession.scriptLoadFailedCallback,
                    t = this._currentTask.get_scriptElement();
                if (this._stopSession(), n) n(this, t), this._nextSession();
                else {
                    this._loading = !1;
                    throw Sys._ScriptLoader._errorScriptLoadFailed(t.src);
                }
            },
            _scriptLoadedHandler: function(n, t) {
                t ? (Array.add(Sys._ScriptLoader._getLoadedScripts(), n.src), this._currentTask.dispose(), this._currentTask = null, this._loadScriptsInternal()) : this._raiseError()
            },
            _scriptLoadTimeoutHandler: function() {
                var n = this._currentSession.scriptLoadTimeoutCallback;
                this._stopSession();
                n && n(this);
                this._nextSession()
            },
            _stopSession: function() {
                this._timeoutCookie && (window.clearTimeout(this._timeoutCookie), this._timeoutCookie = null);
                this._currentTask && (this._currentTask.dispose(), this._currentTask = null)
            }
        };
        n.registerClass("Sys._ScriptLoader", null, Sys.IDisposable);
        n.getInstance = function() {
            var n = Sys._ScriptLoader._activeInstance;
            return n || (n = Sys._ScriptLoader._activeInstance = new Sys._ScriptLoader), n
        };
        n.isScriptLoaded = function(n) {
            var t = document.createElement("script");
            return t.src = n, Array.contains(Sys._ScriptLoader._getLoadedScripts(), t.src)
        };
        n.readLoadedScripts = function() {
            var i, r, n, u, t;
            if (!Sys._ScriptLoader._referencedScripts)
                for (i = Sys._ScriptLoader._referencedScripts = [], r = document.getElementsByTagName("script"), n = r.length - 1; n >= 0; n--) u = r[n], t = u.src, t.length && (Array.contains(i, t) || Array.add(i, t))
        };
        n._errorScriptLoadFailed = function(n) {
            var i, r, t;
            return i = Sys.Res.scriptLoadFailed, r = "Sys.ScriptLoadFailedException: " + String.format(i, n), t = Error.create(r, {
                name: "Sys.ScriptLoadFailedException",
                scriptUrl: n
            }), t.popStackFrame(), t
        };
        n._getLoadedScripts = function() {
            return Sys._ScriptLoader._referencedScripts || (Sys._ScriptLoader._referencedScripts = [], Sys._ScriptLoader.readLoadedScripts()), Sys._ScriptLoader._referencedScripts
        };
        n = Sys.WebForms.PageRequestManager = function() {
            this._form = null;
            this._activeDefaultButton = null;
            this._activeDefaultButtonClicked = !1;
            this._updatePanelIDs = null;
            this._updatePanelClientIDs = null;
            this._updatePanelHasChildrenAsTriggers = null;
            this._asyncPostBackControlIDs = null;
            this._asyncPostBackControlClientIDs = null;
            this._postBackControlIDs = null;
            this._postBackControlClientIDs = null;
            this._scriptManagerID = null;
            this._pageLoadedHandler = null;
            this._additionalInput = null;
            this._onsubmit = null;
            this._onSubmitStatements = [];
            this._originalDoPostBack = null;
            this._originalDoPostBackWithOptions = null;
            this._originalFireDefaultButton = null;
            this._originalDoCallback = null;
            this._isCrossPost = !1;
            this._postBackSettings = null;
            this._request = null;
            this._onFormSubmitHandler = null;
            this._onFormElementClickHandler = null;
            this._onWindowUnloadHandler = null;
            this._asyncPostBackTimeout = null;
            this._controlIDToFocus = null;
            this._scrollPosition = null;
            this._processingRequest = !1;
            this._scriptDisposes = {};
            this._transientFields = ["__VIEWSTATEENCRYPTED", "__VIEWSTATEFIELDCOUNT"];
            this._textTypes = /^(text|password|hidden|search|tel|url|email|number|range|color|datetime|date|month|week|time|datetime-local)$/i
        };
        n.prototype = {
            get_isInAsyncPostBack: function() {
                return this._request !== null
            },
            add_beginRequest: function(n) {
                Sys.Observer.addEventHandler(this, "beginRequest", n)
            },
            remove_beginRequest: function(n) {
                Sys.Observer.removeEventHandler(this, "beginRequest", n)
            },
            add_endRequest: function(n) {
                Sys.Observer.addEventHandler(this, "endRequest", n)
            },
            remove_endRequest: function(n) {
                Sys.Observer.removeEventHandler(this, "endRequest", n)
            },
            add_initializeRequest: function(n) {
                Sys.Observer.addEventHandler(this, "initializeRequest", n)
            },
            remove_initializeRequest: function(n) {
                Sys.Observer.removeEventHandler(this, "initializeRequest", n)
            },
            add_pageLoaded: function(n) {
                Sys.Observer.addEventHandler(this, "pageLoaded", n)
            },
            remove_pageLoaded: function(n) {
                Sys.Observer.removeEventHandler(this, "pageLoaded", n)
            },
            add_pageLoading: function(n) {
                Sys.Observer.addEventHandler(this, "pageLoading", n)
            },
            remove_pageLoading: function(n) {
                Sys.Observer.removeEventHandler(this, "pageLoading", n)
            },
            abortPostBack: function() {
                !this._processingRequest && this._request && (this._request.get_executor().abort(), this._request = null)
            },
            beginAsyncPostBack: function(n, t, i, r, u) {
                if (!r || typeof Page_ClientValidate != "function" || Page_ClientValidate(u || null)) {
                    this._postBackSettings = this._createPostBackSettings(!0, n, t);
                    var f = this._form;
                    f.__EVENTTARGET.value = t || "";
                    f.__EVENTARGUMENT.value = i || "";
                    this._isCrossPost = !1;
                    this._additionalInput = null;
                    this._onFormSubmit()
                }
            },
            _cancelPendingCallbacks: function() {
                for (var i, u, t, n = 0, r = window.__pendingCallbacks.length; n < r; n++) i = window.__pendingCallbacks[n], i && (i.async || (window.__synchronousCallBackIndex = -1), window.__pendingCallbacks[n] = null, u = "__CALLBACKFRAME" + n, t = document.getElementById(u), t && t.parentNode.removeChild(t))
            },
            _commitControls: function(n, t) {
                n && (this._updatePanelIDs = n.updatePanelIDs, this._updatePanelClientIDs = n.updatePanelClientIDs, this._updatePanelHasChildrenAsTriggers = n.updatePanelHasChildrenAsTriggers, this._asyncPostBackControlIDs = n.asyncPostBackControlIDs, this._asyncPostBackControlClientIDs = n.asyncPostBackControlClientIDs, this._postBackControlIDs = n.postBackControlIDs, this._postBackControlClientIDs = n.postBackControlClientIDs);
                typeof t != "undefined" && t !== null && (this._asyncPostBackTimeout = t * 1e3)
            },
            _createHiddenField: function(n, t) {
                var r, i = document.getElementById(n);
                i && (i._isContained ? r = i.parentNode : i.parentNode.removeChild(i));
                r || (r = document.createElement("span"), r.style.cssText = "display:none !important", this._form.appendChild(r));
                r.innerHTML = "<input type='hidden' />";
                i = r.childNodes[0];
                i._isContained = !0;
                i.id = i.name = n;
                i.value = t
            },
            _createPageRequestManagerTimeoutError: function() {
                var t = "Sys.WebForms.PageRequestManagerTimeoutException: " + Sys.WebForms.Res.PRM_TimeoutError,
                    n = Error.create(t, {
                        name: "Sys.WebForms.PageRequestManagerTimeoutException"
                    });
                return n.popStackFrame(), n
            },
            _createPageRequestManagerServerError: function(n, t) {
                var r = "Sys.WebForms.PageRequestManagerServerErrorException: " + (t || String.format(Sys.WebForms.Res.PRM_ServerError, n)),
                    i = Error.create(r, {
                        name: "Sys.WebForms.PageRequestManagerServerErrorException",
                        httpStatusCode: n
                    });
                return i.popStackFrame(), i
            },
            _createPageRequestManagerParserError: function(n) {
                var i = "Sys.WebForms.PageRequestManagerParserErrorException: " + String.format(Sys.WebForms.Res.PRM_ParserError, n),
                    t = Error.create(i, {
                        name: "Sys.WebForms.PageRequestManagerParserErrorException"
                    });
                return t.popStackFrame(), t
            },
            _createPanelID: function(n, t) {
                var r = t.asyncTarget,
                    i = this._ensureUniqueIds(n || t.panelsToUpdate),
                    u = i instanceof Array ? i.join(",") : i || this._scriptManagerID;
                return r && (u += "|" + r), encodeURIComponent(this._scriptManagerID) + "=" + encodeURIComponent(u) + "&"
            },
            _createPostBackSettings: function(n, t, i, r) {
                return {
                    async: n,
                    asyncTarget: i,
                    panelsToUpdate: t,
                    sourceElement: r
                }
            },
            _convertToClientIDs: function(n, t, i, r) {
                var u, e, f, o;
                if (n)
                    for (u = 0, e = n.length; u < e; u += r ? 2 : 1) f = n[u], o = (r ? n[u + 1] : "") || this._uniqueIDToClientID(f), Array.add(t, f), Array.add(i, o)
            },
            dispose: function() {
                Sys.Observer.clearEventHandlers(this);
                this._form && (Sys.UI.DomEvent.removeHandler(this._form, "submit", this._onFormSubmitHandler), Sys.UI.DomEvent.removeHandler(this._form, "click", this._onFormElementClickHandler), Sys.UI.DomEvent.removeHandler(window, "unload", this._onWindowUnloadHandler), Sys.UI.DomEvent.removeHandler(window, "load", this._pageLoadedHandler));
                this._originalDoPostBack && (window.__doPostBack = this._originalDoPostBack, this._originalDoPostBack = null);
                this._originalDoPostBackWithOptions && (window.WebForm_DoPostBackWithOptions = this._originalDoPostBackWithOptions, this._originalDoPostBackWithOptions = null);
                this._originalFireDefaultButton && (window.WebForm_FireDefaultButton = this._originalFireDefaultButton, this._originalFireDefaultButton = null);
                this._originalDoCallback && (window.WebForm_DoCallback = this._originalDoCallback, this._originalDoCallback = null);
                this._form = null;
                this._updatePanelIDs = null;
                this._updatePanelClientIDs = null;
                this._asyncPostBackControlIDs = null;
                this._asyncPostBackControlClientIDs = null;
                this._postBackControlIDs = null;
                this._postBackControlClientIDs = null;
                this._asyncPostBackTimeout = null;
                this._scrollPosition = null
            },
            _doCallback: function(n, t, i, r, u, f) {
                this.get_isInAsyncPostBack() || this._originalDoCallback(n, t, i, r, u, f)
            },
            _doPostBack: function(n, t) {
                var u, r;
                if (this._additionalInput = null, u = this._form, n === null || typeof n == "undefined" || this._isCrossPost) this._postBackSettings = this._createPostBackSettings(!1), this._isCrossPost = !1;
                else {
                    var i = this._masterPageUniqueID,
                        e = this._uniqueIDToClientID(n),
                        f = document.getElementById(e);
                    !f && i && e.indexOf(i + "$") === 0 && (f = document.getElementById(e.substr(i.length + 1)));
                    f ? this._postBackSettings = this._getPostBackSettings(f, n) : Array.contains(this._asyncPostBackControlIDs, n) ? this._postBackSettings = this._createPostBackSettings(!0, null, n) : Array.contains(this._postBackControlIDs, n) ? this._postBackSettings = this._createPostBackSettings(!1) : (r = this._findNearestElement(n), r ? this._postBackSettings = this._getPostBackSettings(r, n) : (i && (i += "$", n.indexOf(i) === 0 && (r = this._findNearestElement(n.substr(i.length)))), this._postBackSettings = r ? this._getPostBackSettings(r, n) : this._createPostBackSettings(!1)))
                }
                if (!this._postBackSettings.async) {
                    u.onsubmit = this._onsubmit;
                    this._originalDoPostBack(n, t);
                    u.onsubmit = null;
                    return
                }
                u.__EVENTTARGET.value = n;
                u.__EVENTARGUMENT.value = t;
                this._onFormSubmit()
            },
            _doPostBackWithOptions: function(n) {
                this._isCrossPost = n && n.actionUrl;
                this._originalDoPostBackWithOptions(n)
            },
            _elementContains: function(n, t) {
                while (t) {
                    if (t === n) return !0;
                    t = t.parentNode
                }
                return !1
            },
            _endPostBack: function(n, t, i) {
                this._request === t.get_webRequest() && (this._processingRequest = !1, this._additionalInput = null, this._request = null);
                var r = new Sys.WebForms.EndRequestEventArgs(n, i ? i.dataItems : {}, t);
                if (Sys.Observer.raiseEvent(this, "endRequest", r), n && !r.get_errorHandled()) throw n;
            },
            _ensureUniqueIds: function(n) {
                var i, t, f, r, u;
                if (!n) return n;
                for (n = n instanceof Array ? n : [n], i = [], t = 0, f = n.length; t < f; t++) r = n[t], u = Array.indexOf(this._updatePanelClientIDs, r), i.push(u > -1 ? this._updatePanelIDs[u] : r);
                return i
            },
            _findNearestElement: function(n) {
                for (var r, t, i; n.length > 0;) {
                    if (r = this._uniqueIDToClientID(n), t = document.getElementById(r), t) return t;
                    if (i = n.lastIndexOf("$"), i === -1) return null;
                    n = n.substring(0, i)
                }
                return null
            },
            _findText: function(n, t) {
                var i = Math.max(0, t - 20),
                    r = Math.min(n.length, t + 20);
                return n.substring(i, r)
            },
            _fireDefaultButton: function(n, t) {
                var r, i;
                if (n.keyCode === 13 && (r = n.srcElement || n.target, (!r || r.tagName.toLowerCase() !== "textarea") && (i = document.getElementById(t), i && typeof i.click != "undefined"))) {
                    this._activeDefaultButton = i;
                    this._activeDefaultButtonClicked = !1;
                    try {
                        i.click()
                    } finally {
                        this._activeDefaultButton = null
                    }
                    return n.cancelBubble = !0, typeof n.stopPropagation == "function" && n.stopPropagation(), !1
                }
                return !0
            },
            _getPageLoadedEventArgs: function(n, t) {
                var h = [],
                    c = [],
                    l = t ? t.version4 : !1,
                    u = t ? t.updatePanelData : null,
                    f, o, s, r, i, e, a, v;
                if (u ? (f = u.updatePanelIDs, o = u.updatePanelClientIDs, s = u.childUpdatePanelIDs, r = u.panelsToRefreshIDs) : (f = this._updatePanelIDs, o = this._updatePanelClientIDs, s = null, r = null), r)
                    for (i = 0, e = r.length; i < e; i += l ? 2 : 1) a = r[i], v = (l ? r[i + 1] : "") || this._uniqueIDToClientID(a), Array.add(h, document.getElementById(v));
                for (i = 0, e = f.length; i < e; i++)(n || Array.indexOf(s, f[i]) !== -1) && Array.add(c, document.getElementById(o[i]));
                return new Sys.WebForms.PageLoadedEventArgs(h, c, t ? t.dataItems : {})
            },
            _getPageLoadingEventArgs: function(n) {
                for (var e = [], o = [], r = n.updatePanelData, s = r.oldUpdatePanelIDs, l = r.oldUpdatePanelClientIDs, a = r.updatePanelIDs, v = r.childUpdatePanelIDs, u = r.panelsToRefreshIDs, i, h, c = n.version4, t = 0, f = u.length; t < f; t += c ? 2 : 1) i = u[t], h = (c ? u[t + 1] : "") || this._uniqueIDToClientID(i), Array.add(e, document.getElementById(h));
                for (t = 0, f = s.length; t < f; t++) i = s[t], Array.indexOf(u, i) === -1 && (Array.indexOf(a, i) === -1 || Array.indexOf(v, i) > -1) && Array.add(o, document.getElementById(l[t]));
                return new Sys.WebForms.PageLoadingEventArgs(e, o, n.dataItems)
            },
            _getPostBackSettings: function(n, t) {
                for (var r = n, i = null, u; n;) {
                    if (n.id) {
                        if (!i && Array.contains(this._asyncPostBackControlClientIDs, n.id)) i = this._createPostBackSettings(!0, null, t, r);
                        else {
                            if (!i && Array.contains(this._postBackControlClientIDs, n.id)) return this._createPostBackSettings(!1);
                            if (u = Array.indexOf(this._updatePanelClientIDs, n.id), u !== -1) return this._updatePanelHasChildrenAsTriggers[u] ? this._createPostBackSettings(!0, [this._updatePanelIDs[u]], t, r) : this._createPostBackSettings(!0, null, t, r)
                        }
                        if (!i && this._matchesParentIDInList(n.id, this._asyncPostBackControlClientIDs)) i = this._createPostBackSettings(!0, null, t, r);
                        else if (!i && this._matchesParentIDInList(n.id, this._postBackControlClientIDs)) return this._createPostBackSettings(!1)
                    }
                    n = n.parentNode
                }
                return i ? i : this._createPostBackSettings(!1)
            },
            _getScrollPosition: function() {
                var n = document.documentElement;
                return n && (this._validPosition(n.scrollLeft) || this._validPosition(n.scrollTop)) ? {
                    x: n.scrollLeft,
                    y: n.scrollTop
                } : (n = document.body, n && (this._validPosition(n.scrollLeft) || this._validPosition(n.scrollTop)) ? {
                    x: n.scrollLeft,
                    y: n.scrollTop
                } : this._validPosition(window.pageXOffset) || this._validPosition(window.pageYOffset) ? {
                    x: window.pageXOffset,
                    y: window.pageYOffset
                } : {
                    x: 0,
                    y: 0
                })
            },
            _initializeInternal: function(n, t, i, r, u, f, e) {
                if (this._prmInitialized) throw Error.invalidOperation(Sys.WebForms.Res.PRM_CannotRegisterTwice);
                this._prmInitialized = !0;
                this._masterPageUniqueID = e;
                this._scriptManagerID = n;
                this._form = Sys.UI.DomElement.resolveElement(t);
                this._onsubmit = this._form.onsubmit;
                this._form.onsubmit = null;
                this._onFormSubmitHandler = Function.createDelegate(this, this._onFormSubmit);
                this._onFormElementClickHandler = Function.createDelegate(this, this._onFormElementClick);
                this._onWindowUnloadHandler = Function.createDelegate(this, this._onWindowUnload);
                Sys.UI.DomEvent.addHandler(this._form, "submit", this._onFormSubmitHandler);
                Sys.UI.DomEvent.addHandler(this._form, "click", this._onFormElementClickHandler);
                Sys.UI.DomEvent.addHandler(window, "unload", this._onWindowUnloadHandler);
                this._originalDoPostBack = window.__doPostBack;
                this._originalDoPostBack && (window.__doPostBack = Function.createDelegate(this, this._doPostBack));
                this._originalDoPostBackWithOptions = window.WebForm_DoPostBackWithOptions;
                this._originalDoPostBackWithOptions && (window.WebForm_DoPostBackWithOptions = Function.createDelegate(this, this._doPostBackWithOptions));
                this._originalFireDefaultButton = window.WebForm_FireDefaultButton;
                this._originalFireDefaultButton && (window.WebForm_FireDefaultButton = Function.createDelegate(this, this._fireDefaultButton));
                this._originalDoCallback = window.WebForm_DoCallback;
                this._originalDoCallback && (window.WebForm_DoCallback = Function.createDelegate(this, this._doCallback));
                this._pageLoadedHandler = Function.createDelegate(this, this._pageLoadedInitialLoad);
                Sys.UI.DomEvent.addHandler(window, "load", this._pageLoadedHandler);
                i && this._updateControls(i, r, u, f, !0)
            },
            _matchesParentIDInList: function(n, t) {
                for (var i = 0, r = t.length; i < r; i++)
                    if (n.startsWith(t[i] + "_")) return !0;
                return !1
            },
            _onFormElementActive: function(n, t, i) {
                var r, u;
                n.disabled || (this._postBackSettings = this._getPostBackSettings(n, n.name), n.name && (r = n.tagName.toUpperCase(), r === "INPUT" ? (u = n.type, u === "submit" ? this._additionalInput = encodeURIComponent(n.name) + "=" + encodeURIComponent(n.value) : u === "image" && (this._additionalInput = encodeURIComponent(n.name) + ".x=" + t + "&" + encodeURIComponent(n.name) + ".y=" + i)) : r === "BUTTON" && n.name.length !== 0 && n.type === "submit" && (this._additionalInput = encodeURIComponent(n.name) + "=" + encodeURIComponent(n.value))))
            },
            _onFormElementClick: function(n) {
                this._activeDefaultButtonClicked = n.target === this._activeDefaultButton;
                this._onFormElementActive(n.target, n.offsetX, n.offsetY)
            },
            _onFormSubmit: function(n) {
                var f, k, s = !0,
                    nt = this._isCrossPost,
                    c, u, e, l, a, g, v, p, i, r, w, y, b, h, o;
                if (this._isCrossPost = !1, this._onsubmit && (s = this._onsubmit()), s)
                    for (f = 0, k = this._onSubmitStatements.length; f < k; f++)
                        if (!this._onSubmitStatements[f]()) {
                            s = !1;
                            break
                        }
                if (!s) {
                    n && n.preventDefault();
                    return
                }
                if ((c = this._form, !nt) && (this._activeDefaultButton && !this._activeDefaultButtonClicked && this._onFormElementActive(this._activeDefaultButton, 0, 0), this._postBackSettings && this._postBackSettings.async)) {
                    var t = new Sys.StringBuilder,
                        tt = c.elements.length,
                        d = this._createPanelID(null, this._postBackSettings);
                    for (t.append(d), f = 0; f < tt; f++)
                        if (u = c.elements[f], e = u.name, typeof e != "undefined" && e !== null && e.length !== 0 && e !== this._scriptManagerID)
                            if (l = u.tagName.toUpperCase(), l === "INPUT") a = u.type, (this._textTypes.test(a) || (a === "checkbox" || a === "radio") && u.checked) && (t.append(encodeURIComponent(e)), t.append("="), t.append(encodeURIComponent(u.value)), t.append("&"));
                            else if (l === "SELECT")
                                for (g = u.options.length, v = 0; v < g; v++) p = u.options[v], p.selected && (t.append(encodeURIComponent(e)), t.append("="), t.append(encodeURIComponent(p.value)), t.append("&"));
                            else l === "TEXTAREA" && (t.append(encodeURIComponent(e)), t.append("="), t.append(encodeURIComponent(u.value)), t.append("&"));
                    if (t.append("__ASYNCPOST=true&"), this._additionalInput && (t.append(this._additionalInput), this._additionalInput = null), i = new Sys.Net.WebRequest, r = c.action, Sys.Browser.agent === Sys.Browser.InternetExplorer && (w = r.indexOf("#"), w !== -1 && (r = r.substr(0, w)), y = r.indexOf("?"), y !== -1 ? (b = r.substr(0, y), b.indexOf("%") === -1 && (r = encodeURI(b) + r.substr(y))) : r.indexOf("%") === -1 && (r = encodeURI(r))), i.set_url(r), i.get_headers()["X-MicrosoftAjax"] = "Delta=true", i.get_headers()["Cache-Control"] = "no-cache", i.set_timeout(this._asyncPostBackTimeout), i.add_completed(Function.createDelegate(this, this._onFormSubmitCompleted)), i.set_body(t.toString()), h = this._postBackSettings.panelsToUpdate, o = new Sys.WebForms.InitializeRequestEventArgs(i, this._postBackSettings.sourceElement, h), Sys.Observer.raiseEvent(this, "initializeRequest", o), s = !o.get_cancel(), !s) {
                        n && n.preventDefault();
                        return
                    }
                    o && o._updated && (h = o.get_updatePanelsToUpdate(), i.set_body(i.get_body().replace(d, this._createPanelID(h, this._postBackSettings))));
                    this._scrollPosition = this._getScrollPosition();
                    this.abortPostBack();
                    o = new Sys.WebForms.BeginRequestEventArgs(i, this._postBackSettings.sourceElement, h || this._postBackSettings.panelsToUpdate);
                    Sys.Observer.raiseEvent(this, "beginRequest", o);
                    this._originalDoCallback && this._cancelPendingCallbacks();
                    this._request = i;
                    this._processingRequest = !1;
                    i.invoke();
                    n && n.preventDefault()
                }
            },
            _onFormSubmitCompleted: function(n) {
                var t, i, r, s, u, f, h, c;
                if (this._processingRequest = !0, n.get_timedOut()) {
                    this._endPostBack(this._createPageRequestManagerTimeoutError(), n, null);
                    return
                }
                if (n.get_aborted()) {
                    this._endPostBack(null, n, null);
                    return
                }
                if (this._request && n.get_webRequest() === this._request) {
                    if (n.get_statusCode() !== 200) {
                        this._endPostBack(this._createPageRequestManagerServerError(n.get_statusCode()), n, null);
                        return
                    }
                    if (t = this._parseDelta(n), t) {
                        if (t.asyncPostBackControlIDsNode && t.postBackControlIDsNode && t.updatePanelIDsNode && t.panelsToRefreshNode && t.childUpdatePanelIDsNode) {
                            var a = this._updatePanelIDs,
                                v = this._updatePanelClientIDs,
                                l = t.childUpdatePanelIDsNode.content,
                                y = l.length ? l.split(",") : [],
                                p = this._splitNodeIntoArray(t.asyncPostBackControlIDsNode),
                                w = this._splitNodeIntoArray(t.postBackControlIDsNode),
                                b = this._splitNodeIntoArray(t.updatePanelIDsNode),
                                e = this._splitNodeIntoArray(t.panelsToRefreshNode),
                                o = t.version4;
                            for (i = 0, r = e.length; i < r; i += o ? 2 : 1)
                                if (s = (o ? e[i + 1] : "") || this._uniqueIDToClientID(e[i]), !document.getElementById(s)) {
                                    this._endPostBack(Error.invalidOperation(String.format(Sys.WebForms.Res.PRM_MissingPanel, s)), n, t);
                                    return
                                }
                            u = this._processUpdatePanelArrays(b, p, w, o);
                            u.oldUpdatePanelIDs = a;
                            u.oldUpdatePanelClientIDs = v;
                            u.childUpdatePanelIDs = y;
                            u.panelsToRefreshIDs = e;
                            t.updatePanelData = u
                        }
                        for (t.dataItems = {}, i = 0, r = t.dataItemNodes.length; i < r; i++) f = t.dataItemNodes[i], t.dataItems[f.id] = f.content;
                        for (i = 0, r = t.dataItemJsonNodes.length; i < r; i++) f = t.dataItemJsonNodes[i], t.dataItems[f.id] = Sys.Serialization.JavaScriptSerializer.deserialize(f.content);
                        h = Sys.Observer._getContext(this, !0).events.getHandler("pageLoading");
                        h && h(this, this._getPageLoadingEventArgs(t));
                        Sys._ScriptLoader.readLoadedScripts();
                        Sys.Application.beginCreateComponents();
                        c = Sys._ScriptLoader.getInstance();
                        this._queueScripts(c, t.scriptBlockNodes, !0, !1);
                        this._processingRequest = !0;
                        c.loadScripts(0, Function.createDelegate(this, Function.createCallback(this._scriptIncludesLoadComplete, t)), Function.createDelegate(this, Function.createCallback(this._scriptIncludesLoadFailed, t)), null)
                    }
                }
            },
            _onWindowUnload: function() {
                this.dispose()
            },
            _pageLoaded: function(n, t) {
                Sys.Observer.raiseEvent(this, "pageLoaded", this._getPageLoadedEventArgs(n, t));
                n || Sys.Application.raiseLoad()
            },
            _pageLoadedInitialLoad: function() {
                this._pageLoaded(!0, null)
            },
            _parseDelta: function(n) {
                for (var r = n.get_responseData(), u, o, l, a, v, i = 0, f = null, c = [], h, ct, t, e; i < r.length;) {
                    if (u = r.indexOf("|", i), u === -1) {
                        f = this._findText(r, i);
                        break
                    }
                    if (o = parseInt(r.substring(i, u), 10), o % 1 != 0) {
                        f = this._findText(r, i);
                        break
                    }
                    if (i = u + 1, u = r.indexOf("|", i), u === -1) {
                        f = this._findText(r, i);
                        break
                    }
                    if (l = r.substring(i, u), i = u + 1, u = r.indexOf("|", i), u === -1) {
                        f = this._findText(r, i);
                        break
                    }
                    if (a = r.substring(i, u), i = u + 1, i + o >= r.length) {
                        f = this._findText(r, r.length);
                        break
                    }
                    if (v = r.substr(i, o), i += o, r.charAt(i) !== "|") {
                        f = this._findText(r, i);
                        break
                    }
                    i++;
                    Array.add(c, {
                        type: l,
                        id: a,
                        content: v
                    })
                }
                if (f) return this._endPostBack(this._createPageRequestManagerParserError(String.format(Sys.WebForms.Res.PRM_ParserErrorDetails, f)), n, null), null;
                var y = [],
                    p = [],
                    w = [],
                    b = [],
                    k = [],
                    d = [],
                    g = [],
                    nt = [],
                    tt = [],
                    it = [],
                    rt, ut, ft, et, ot, st, ht, s;
                for (h = 0, ct = c.length; h < ct; h++) {
                    t = c[h];
                    switch (t.type) {
                        case "#":
                            s = t;
                            break;
                        case "updatePanel":
                            Array.add(y, t);
                            break;
                        case "hiddenField":
                            Array.add(p, t);
                            break;
                        case "arrayDeclaration":
                            Array.add(w, t);
                            break;
                        case "scriptBlock":
                            Array.add(b, t);
                            break;
                        case "scriptStartupBlock":
                            Array.add(k, t);
                            break;
                        case "expando":
                            Array.add(d, t);
                            break;
                        case "onSubmit":
                            Array.add(g, t);
                            break;
                        case "asyncPostBackControlIDs":
                            rt = t;
                            break;
                        case "postBackControlIDs":
                            ut = t;
                            break;
                        case "updatePanelIDs":
                            ft = t;
                            break;
                        case "asyncPostBackTimeout":
                            et = t;
                            break;
                        case "childUpdatePanelIDs":
                            ot = t;
                            break;
                        case "panelsToRefreshIDs":
                            st = t;
                            break;
                        case "formAction":
                            ht = t;
                            break;
                        case "dataItem":
                            Array.add(nt, t);
                            break;
                        case "dataItemJson":
                            Array.add(tt, t);
                            break;
                        case "scriptDispose":
                            Array.add(it, t);
                            break;
                        case "pageRedirect":
                            if (s && parseFloat(s.content) >= 4 && (t.content = unescape(t.content)), Sys.Browser.agent === Sys.Browser.InternetExplorer) {
                                e = document.createElement("a");
                                e.style.display = "none";
                                e.attachEvent("onclick", lt);
                                e.href = t.content;
                                this._form.parentNode.insertBefore(e, this._form);
                                e.click();
                                e.detachEvent("onclick", lt);
                                this._form.parentNode.removeChild(e);

                                function lt(n) {
                                    n.cancelBubble = !0
                                }
                            } else window.location.href = t.content;
                            return null;
                        case "error":
                            return this._endPostBack(this._createPageRequestManagerServerError(Number.parseInvariant(t.id), t.content), n, null), null;
                        case "pageTitle":
                            document.title = t.content;
                            break;
                        case "focus":
                            this._controlIDToFocus = t.content;
                            break;
                        default:
                            return this._endPostBack(this._createPageRequestManagerParserError(String.format(Sys.WebForms.Res.PRM_UnknownToken, t.type)), n, null), null
                    }
                }
                return {
                    version4: s ? parseFloat(s.content) >= 4 : !1,
                    executor: n,
                    updatePanelNodes: y,
                    hiddenFieldNodes: p,
                    arrayDeclarationNodes: w,
                    scriptBlockNodes: b,
                    scriptStartupNodes: k,
                    expandoNodes: d,
                    onSubmitNodes: g,
                    dataItemNodes: nt,
                    dataItemJsonNodes: tt,
                    scriptDisposeNodes: it,
                    asyncPostBackControlIDsNode: rt,
                    postBackControlIDsNode: ut,
                    updatePanelIDsNode: ft,
                    asyncPostBackTimeoutNode: et,
                    childUpdatePanelIDsNode: ot,
                    panelsToRefreshNode: st,
                    formActionNode: ht
                }
            },
            _processUpdatePanelArrays: function(n, t, i, r) {
                var h, c, l, f, e, o, s, b, u, a, v, y, p, w;
                if (n)
                    for (f = n.length, e = r ? 2 : 1, h = new Array(f / e), c = new Array(f / e), l = new Array(f / e), o = 0, s = 0; o < f; o += e, s++) u = n[o], a = r ? n[o + 1] : "", b = u.charAt(0) === "t", u = u.substr(1), a || (a = this._uniqueIDToClientID(u)), l[s] = b, h[s] = u, c[s] = a;
                else h = [], c = [], l = [];
                return v = [], y = [], this._convertToClientIDs(t, v, y, r), p = [], w = [], this._convertToClientIDs(i, p, w, r), {
                    updatePanelIDs: h,
                    updatePanelClientIDs: c,
                    updatePanelHasChildrenAsTriggers: l,
                    asyncPostBackControlIDs: v,
                    asyncPostBackControlClientIDs: y,
                    postBackControlIDs: p,
                    postBackControlClientIDs: w
                }
            },
            _queueScripts: function(n, t, i, r) {
                for (var o, f, u = 0, e = t.length; u < e; u++) {
                    o = t[u].id;
                    switch (o) {
                        case "ScriptContentNoTags":
                            if (!r) continue;
                            n.queueScriptBlock(t[u].content);
                            break;
                        case "ScriptContentWithTags":
                            if (f = window.eval("(" + t[u].content + ")"), f.src) {
                                if (!i || Sys._ScriptLoader.isScriptLoaded(f.src)) continue
                            } else if (!r) continue;
                            n.queueCustomScriptTag(f);
                            break;
                        case "ScriptPath":
                            if (!i || Sys._ScriptLoader.isScriptLoaded(t[u].content)) continue;
                            n.queueScriptReference(t[u].content)
                    }
                }
            },
            _registerDisposeScript: function(n, t) {
                this._scriptDisposes[n] ? Array.add(this._scriptDisposes[n], t) : this._scriptDisposes[n] = [t]
            },
            _scriptIncludesLoadComplete: function(n, t) {
                var i, u, r, h, e, c, o, s, f;
                if (t.executor.get_webRequest() === this._request) {
                    for (this._commitControls(t.updatePanelData, t.asyncPostBackTimeoutNode ? t.asyncPostBackTimeoutNode.content : null), t.formActionNode && (this._form.action = t.formActionNode.content), i = 0, u = t.updatePanelNodes.length; i < u; i++) {
                        if (r = t.updatePanelNodes[i], h = document.getElementById(r.id), !h) {
                            this._endPostBack(Error.invalidOperation(String.format(Sys.WebForms.Res.PRM_MissingPanel, r.id)), t.executor, t);
                            return
                        }
                        this._updatePanel(h, r.content)
                    }
                    for (i = 0, u = t.scriptDisposeNodes.length; i < u; i++) r = t.scriptDisposeNodes[i], this._registerDisposeScript(r.id, r.content);
                    for (i = 0, u = this._transientFields.length; i < u; i++) e = document.getElementById(this._transientFields[i]), e && (c = e._isContained ? e.parentNode : e, c.parentNode.removeChild(c));
                    for (i = 0, u = t.hiddenFieldNodes.length; i < u; i++) r = t.hiddenFieldNodes[i], this._createHiddenField(r.id, r.content);
                    if (t.scriptsFailed) throw Sys._ScriptLoader._errorScriptLoadFailed(t.scriptsFailed.src, t.scriptsFailed.multipleCallbacks);
                    for (this._queueScripts(n, t.scriptBlockNodes, !1, !0), o = "", i = 0, u = t.arrayDeclarationNodes.length; i < u; i++) r = t.arrayDeclarationNodes[i], o += "Sys.WebForms.PageRequestManager._addArrayElement('" + r.id + "', " + r.content + ");\r\n";
                    for (s = "", i = 0, u = t.expandoNodes.length; i < u; i++) r = t.expandoNodes[i], s += r.id + " = " + r.content + "\r\n";
                    for (o.length && n.queueScriptBlock(o), s.length && n.queueScriptBlock(s), this._queueScripts(n, t.scriptStartupNodes, !0, !0), f = "", i = 0, u = t.onSubmitNodes.length; i < u; i++) i === 0 && (f = "Array.add(Sys.WebForms.PageRequestManager.getInstance()._onSubmitStatements, function() {\r\n"), f += t.onSubmitNodes[i].content + "\r\n";
                    f.length && (f += "\r\nreturn true;\r\n});\r\n", n.queueScriptBlock(f));
                    n.loadScripts(0, Function.createDelegate(this, Function.createCallback(this._scriptsLoadComplete, t)), null, null)
                }
            },
            _scriptIncludesLoadFailed: function(n, t, i, r) {
                r.scriptsFailed = {
                    src: t.src,
                    multipleCallbacks: i
                };
                this._scriptIncludesLoadComplete(n, r)
            },
            _scriptsLoadComplete: function(n, t) {
                var f = t.executor,
                    i, u, r;
                window.__theFormPostData && (window.__theFormPostData = "");
                window.__theFormPostCollection && (window.__theFormPostCollection = []);
                window.WebForm_InitCallback && window.WebForm_InitCallback();
                this._scrollPosition && (window.scrollTo && window.scrollTo(this._scrollPosition.x, this._scrollPosition.y), this._scrollPosition = null);
                Sys.Application.endCreateComponents();
                this._pageLoaded(!1, t);
                this._endPostBack(null, f, t);
                this._controlIDToFocus && (Sys.Browser.agent === Sys.Browser.InternetExplorer && (r = $get(this._controlIDToFocus), i = r, r && !WebForm_CanFocus(r) && (i = WebForm_FindFirstFocusableChild(r)), i && typeof i.contentEditable != "undefined" ? (u = i.contentEditable, i.contentEditable = !1) : i = null), WebForm_AutoFocus(this._controlIDToFocus), i && (i.contentEditable = u), this._controlIDToFocus = null)
            },
            _splitNodeIntoArray: function(n) {
                var t = n.content;
                return t.length ? t.split(",") : []
            },
            _uniqueIDToClientID: function(n) {
                return n.replace(/\$/g, "_")
            },
            _updateControls: function(n, t, i, r, u) {
                this._commitControls(this._processUpdatePanelArrays(n, t, i, u), r)
            },
            _updatePanel: function(n, t) {
                var i, u, r, f;
                for (i in this._scriptDisposes)
                    if (this._elementContains(n, document.getElementById(i))) {
                        for (u = this._scriptDisposes[i], r = 0, f = u.length; r < f; r++) window.eval(u[r]);
                        delete this._scriptDisposes[i]
                    }
                Sys.Application.disposeElement(n, !0);
                n.innerHTML = t
            },
            _validPosition: function(n) {
                return typeof n != "undefined" && n !== null && n !== 0
            }
        };
        n.getInstance = function() {
            var n = Sys.WebForms.PageRequestManager._instance;
            return n || (n = Sys.WebForms.PageRequestManager._instance = new Sys.WebForms.PageRequestManager), n
        };
        n._addArrayElement = function(n) {
            window[n] || (window[n] = []);
            for (var t = 1, i = arguments.length; t < i; t++) Array.add(window[n], arguments[t])
        };
        n._initialize = function() {
            var n = Sys.WebForms.PageRequestManager.getInstance();
            n._initializeInternal.apply(n, arguments)
        };
        n.registerClass("Sys.WebForms.PageRequestManager");
        n = Sys.UI._UpdateProgress = function(n) {
            Sys.UI._UpdateProgress.initializeBase(this, [n]);
            this._displayAfter = 500;
            this._dynamicLayout = !0;
            this._associatedUpdatePanelId = null;
            this._beginRequestHandlerDelegate = null;
            this._startDelegate = null;
            this._endRequestHandlerDelegate = null;
            this._pageRequestManager = null;
            this._timerCookie = null
        };
        n.prototype = {
            get_displayAfter: function() {
                return this._displayAfter
            },
            set_displayAfter: function(n) {
                this._displayAfter = n
            },
            get_dynamicLayout: function() {
                return this._dynamicLayout
            },
            set_dynamicLayout: function(n) {
                this._dynamicLayout = n
            },
            get_associatedUpdatePanelId: function() {
                return this._associatedUpdatePanelId
            },
            set_associatedUpdatePanelId: function(n) {
                this._associatedUpdatePanelId = n
            },
            get_role: function() {
                return "status"
            },
            _clearTimeout: function() {
                this._timerCookie && (window.clearTimeout(this._timerCookie), this._timerCookie = null)
            },
            _getUniqueID: function(n) {
                var t = Array.indexOf(this._pageRequestManager._updatePanelClientIDs, n);
                return t === -1 ? null : this._pageRequestManager._updatePanelIDs[t]
            },
            _handleBeginRequest: function(n, t) {
                var i = t.get_postBackElement(),
                    u = !0,
                    f = this._associatedUpdatePanelId,
                    r;
                for (this._associatedUpdatePanelId && (r = t.get_updatePanelsToUpdate(), u = r && r.length ? Array.contains(r, f) || Array.contains(r, this._getUniqueID(f)) : !1); !u && i;) i.id && this._associatedUpdatePanelId === i.id && (u = !0), i = i.parentNode;
                u && (this._timerCookie = window.setTimeout(this._startDelegate, this._displayAfter))
            },
            _startRequest: function() {
                if (this._pageRequestManager.get_isInAsyncPostBack()) {
                    var n = this.get_element();
                    this._dynamicLayout ? n.style.display = "block" : n.style.visibility = "visible";
                    this.get_role() === "status" && n.setAttribute("aria-hidden", "false")
                }
                this._timerCookie = null
            },
            _handleEndRequest: function() {
                var n = this.get_element();
                this._dynamicLayout ? n.style.display = "none" : n.style.visibility = "hidden";
                this.get_role() === "status" && n.setAttribute("aria-hidden", "true");
                this._clearTimeout()
            },
            dispose: function() {
                this._beginRequestHandlerDelegate !== null && (this._pageRequestManager.remove_beginRequest(this._beginRequestHandlerDelegate), this._pageRequestManager.remove_endRequest(this._endRequestHandlerDelegate), this._beginRequestHandlerDelegate = null, this._endRequestHandlerDelegate = null);
                this._clearTimeout();
                Sys.UI._UpdateProgress.callBaseMethod(this, "dispose")
            },
            initialize: function() {
                Sys.UI._UpdateProgress.callBaseMethod(this, "initialize");
                this.get_role() === "status" && this.get_element().setAttribute("aria-hidden", "true");
                this._beginRequestHandlerDelegate = Function.createDelegate(this, this._handleBeginRequest);
                this._endRequestHandlerDelegate = Function.createDelegate(this, this._handleEndRequest);
                this._startDelegate = Function.createDelegate(this, this._startRequest);
                Sys.WebForms && Sys.WebForms.PageRequestManager && (this._pageRequestManager = Sys.WebForms.PageRequestManager.getInstance());
                this._pageRequestManager !== null && (this._pageRequestManager.add_beginRequest(this._beginRequestHandlerDelegate), this._pageRequestManager.add_endRequest(this._endRequestHandlerDelegate))
            }
        };
        n.registerClass("Sys.UI._UpdateProgress", Sys.UI.Control)
    }
    window.Sys && Sys.loader ? Sys.loader.registerScript("WebForms", ["ComponentModel", "Serialization", "Network"], n) : n()
})();
Type.registerNamespace('Sys.WebForms');
Sys.WebForms.Res = {
    "PRM_UnknownToken": "Unknown token: \u0027{0}\u0027.",
    "PRM_MissingPanel": "Could not find UpdatePanel with ID \u0027{0}\u0027. If it is being updated dynamically then it must be inside another UpdatePanel.",
    "PRM_ServerError": "An unknown error occurred while processing the request on the server. The status code returned from the server was: {0}",
    "PRM_ParserError": "The message received from the server could not be parsed. Common causes for this error are when the response is modified by calls to Response.Write(), response filters, HttpModules, or server trace is enabled.\nDetails: {0}",
    "PRM_TimeoutError": "The server request timed out.",
    "PRM_ParserErrorDetails": "Error parsing near \u0027{0}\u0027.",
    "PRM_CannotRegisterTwice": "The PageRequestManager cannot be initialized more than once."
};