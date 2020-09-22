import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Allows subtrees to request to be kept alive in lazy lists.
///
/// See also:
///
///  * [AutomaticKeepAlive]
///  * [AutomaticKeepAliveClientMixin]
void useAutomaticKeepAliveClient({bool wantKeepAlive = true}) {
  use(_AutomaticKeepAliveClientHook(wantKeepAlive));
}

class _AutomaticKeepAliveClientHook extends Hook<void> {
  final bool wantKeepAlive;

  _AutomaticKeepAliveClientHook(this.wantKeepAlive);

  @override
  _AutomaticKeepAliveClientHookState createState() =>
      _AutomaticKeepAliveClientHookState();
}

class _AutomaticKeepAliveClientHookState
    extends HookState<void, _AutomaticKeepAliveClientHook> {
  KeepAliveHandle _keepAliveHandle;

  bool get wantKeepAlive => hook.wantKeepAlive;

  void _ensureKeepAlive() {
    assert(_keepAliveHandle == null);
    _keepAliveHandle = KeepAliveHandle();
    KeepAliveNotification(_keepAliveHandle).dispatch(context);
  }

  void _releaseKeepAlive() {
    _keepAliveHandle.release();
    _keepAliveHandle = null;
  }

  /// Ensures that any [AutomaticKeepAlive] ancestors are in a good state, by
  /// firing a [KeepAliveNotification] or triggering the [KeepAliveHandle] as
  /// appropriate.
  @protected
  void updateKeepAlive() {
    if (wantKeepAlive) {
      if (_keepAliveHandle == null) _ensureKeepAlive();
    } else {
      if (_keepAliveHandle != null) _releaseKeepAlive();
    }
  }

  @override
  initHook() {
    super.initHook();
    if (wantKeepAlive) _ensureKeepAlive();
  }

  @override
  void deactivate() {
    if (_keepAliveHandle != null) _releaseKeepAlive();
    super.deactivate();
  }

  @override
  void build(BuildContext context) {
    if (wantKeepAlive && _keepAliveHandle == null) _ensureKeepAlive();
  }
}
