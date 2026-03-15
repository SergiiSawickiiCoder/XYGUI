# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['C:\\Users\\GANS\\OneDrive\\Desktop\\1\\схеми\\XYGUI\\source_files\\dps_GUI_program.py'],
    pathex=[],
    binaries=[],
    datas=[('C:\\Users\\GANS\\OneDrive\\Desktop\\1\\схеми\\XYGUI\\source_files\\dps_GUI.ui', '.'), ('C:\\Users\\GANS\\OneDrive\\Desktop\\1\\схеми\\XYGUI\\source_files\\dps5005_limits.ini', '.'), ('C:\\Users\\GANS\\OneDrive\\Desktop\\1\\схеми\\XYGUI\\source_files\\icon', 'icon')],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='XYGUI',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='XYGUI',
)
