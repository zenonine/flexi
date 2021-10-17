import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

class _ExpectedLayout {
  const _ExpectedLayout(
    this.layout, {
    required this.width,
    required this.breakpoint,
    required this.format,
    required this.bodyWidth,
  });

  final Layout layout;
  final double width;
  final Breakpoint breakpoint;
  final LayoutFormat format;
  final double bodyWidth;
}

void main() {
  const fluidLayout = FluidLayout();
  const expectedFluidLayouts = [
    _ExpectedLayout(
      fluidLayout,
      width: 0,
      breakpoint: FluidBreakpoint(
        id: FluidBreakpointId.fluid,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 1,
        gutter: 0,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      ),
      bodyWidth: 0,
    ),
    _ExpectedLayout(
      fluidLayout,
      width: 100,
      breakpoint: FluidBreakpoint(
        id: FluidBreakpointId.fluid,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 1,
        gutter: 0,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      ),
      bodyWidth: 100,
    ),
  ];

  const materialLayout = MaterialLayout();
  const expectedMaterialLayouts = [
    _ExpectedLayout(
      materialLayout,
      width: 0,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 4,
        gutter: 16,
        leftMargin: 16,
        topMargin: 0,
        rightMargin: 16,
        bottomMargin: 0,
      ),
      bodyWidth: 0,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 32,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 4,
        gutter: 16,
        leftMargin: 16,
        topMargin: 0,
        rightMargin: 16,
        bottomMargin: 0,
      ),
      bodyWidth: 0,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 33,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 4,
        gutter: 16,
        leftMargin: 16,
        topMargin: 0,
        rightMargin: 16,
        bottomMargin: 0,
      ),
      bodyWidth: 1,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 300,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 4,
        gutter: 16,
        leftMargin: 16,
        topMargin: 0,
        rightMargin: 16,
        bottomMargin: 0,
      ),
      bodyWidth: 300 - 2 * 16,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 599,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 4,
        gutter: 16,
        leftMargin: 16,
        topMargin: 0,
        rightMargin: 16,
        bottomMargin: 0,
      ),
      bodyWidth: 599 - 2 * 16,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 600,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.sm,
        minWidth: 600,
      ),
      format: LayoutFormat(
        columns: 8,
        gutter: 24,
        leftMargin: 32,
        topMargin: 0,
        rightMargin: 32,
        bottomMargin: 0,
      ),
      bodyWidth: 600 - 2 * 32,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 800,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.sm,
        minWidth: 600,
      ),
      format: LayoutFormat(
        columns: 8,
        gutter: 24,
        leftMargin: 32,
        topMargin: 0,
        rightMargin: 32,
        bottomMargin: 0,
      ),
      bodyWidth: 800 - 2 * 32,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 904,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.sm,
        minWidth: 600,
      ),
      format: LayoutFormat(
        columns: 8,
        gutter: 24,
        leftMargin: 32,
        topMargin: 0,
        rightMargin: 32,
        bottomMargin: 0,
      ),
      bodyWidth: 904 - 2 * 32,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 905,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.sm,
        minWidth: 600,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 32.5,
        topMargin: 0,
        rightMargin: 32.5,
        bottomMargin: 0,
      ),
      bodyWidth: 905 - 2 * 32.5,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1000,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.sm,
        minWidth: 600,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1000 - 840) / 2,
        topMargin: 0,
        rightMargin: (1000 - 840) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 840,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1239,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.sm,
        minWidth: 600,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1239 - 840) / 2,
        topMargin: 0,
        rightMargin: (1239 - 840) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 840,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1240,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.md,
        minWidth: 1240,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 200,
        topMargin: 0,
        rightMargin: 200,
        bottomMargin: 0,
      ),
      bodyWidth: 1240 - 2 * 200,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1300,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.md,
        minWidth: 1240,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 200,
        topMargin: 0,
        rightMargin: 200,
        bottomMargin: 0,
      ),
      bodyWidth: 1300 - 2 * 200,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1439,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.md,
        minWidth: 1240,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 200,
        topMargin: 0,
        rightMargin: 200,
        bottomMargin: 0,
      ),
      bodyWidth: 1439 - 2 * 200,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1440,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.lg,
        minWidth: 1440,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1440 - 1040) / 2,
        topMargin: 0,
        rightMargin: (1440 - 1040) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1040,
    ),
    _ExpectedLayout(
      materialLayout,
      width: 1500,
      breakpoint: MaterialBreakpoint(
        id: MaterialBreakpointId.lg,
        minWidth: 1440,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1500 - 1040) / 2,
        topMargin: 0,
        rightMargin: (1500 - 1040) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1040,
    ),
  ];

  const bootstrapLayout = BootstrapLayout();
  const expectedBootstrapLayouts = [
    _ExpectedLayout(
      bootstrapLayout,
      width: 0,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      ),
      bodyWidth: 0,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 100,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      ),
      bodyWidth: 100,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 575,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xs,
        minWidth: 0,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: 0,
        topMargin: 0,
        rightMargin: 0,
        bottomMargin: 0,
      ),
      bodyWidth: 575,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 576,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.sm,
        minWidth: 576,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (576 - 540) / 2,
        topMargin: 0,
        rightMargin: (576 - 540) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 540,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 600,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.sm,
        minWidth: 576,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (600 - 540) / 2,
        topMargin: 0,
        rightMargin: (600 - 540) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 540,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 767,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.sm,
        minWidth: 576,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (767 - 540) / 2,
        topMargin: 0,
        rightMargin: (767 - 540) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 540,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 768,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.md,
        minWidth: 768,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (768 - 720) / 2,
        topMargin: 0,
        rightMargin: (768 - 720) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 720,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 800,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.md,
        minWidth: 768,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (800 - 720) / 2,
        topMargin: 0,
        rightMargin: (800 - 720) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 720,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 991,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.md,
        minWidth: 768,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (991 - 720) / 2,
        topMargin: 0,
        rightMargin: (991 - 720) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 720,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 992,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.lg,
        minWidth: 992,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (992 - 960) / 2,
        topMargin: 0,
        rightMargin: (992 - 960) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 960,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1100,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.lg,
        minWidth: 992,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1100 - 960) / 2,
        topMargin: 0,
        rightMargin: (1100 - 960) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 960,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1199,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.lg,
        minWidth: 992,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1199 - 960) / 2,
        topMargin: 0,
        rightMargin: (1199 - 960) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 960,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1200,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xl,
        minWidth: 1200,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1200 - 1140) / 2,
        topMargin: 0,
        rightMargin: (1200 - 1140) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1140,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1300,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xl,
        minWidth: 1200,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1300 - 1140) / 2,
        topMargin: 0,
        rightMargin: (1300 - 1140) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1140,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1399,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xl,
        minWidth: 1200,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1399 - 1140) / 2,
        topMargin: 0,
        rightMargin: (1399 - 1140) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1140,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1400,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xxl,
        minWidth: 1400,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1400 - 1320) / 2,
        topMargin: 0,
        rightMargin: (1400 - 1320) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1320,
    ),
    _ExpectedLayout(
      bootstrapLayout,
      width: 1500,
      breakpoint: BootstrapBreakpoint(
        id: BootstrapBreakpointId.xxl,
        minWidth: 1400,
      ),
      format: LayoutFormat(
        columns: 12,
        gutter: 24,
        leftMargin: (1500 - 1320) / 2,
        topMargin: 0,
        rightMargin: (1500 - 1320) / 2,
        bottomMargin: 0,
      ),
      bodyWidth: 1320,
    ),
  ];

  const Map<Type, List<_ExpectedLayout>> expectedTypedLayouts = {
    FluidLayout: expectedFluidLayouts,
    MaterialLayout: expectedMaterialLayouts,
    BootstrapLayout: expectedBootstrapLayouts,
    // TODO: CarbonLayout
  };

  expectedTypedLayouts.forEach((key, expectedLayouts) {
    group('Given layout $key', () {
      for (var expectedLayout in expectedLayouts) {
        final layout = expectedLayout.layout;
        final format = layout.format(expectedLayout.width);
        group('Given current width ${expectedLayout.width}', () {
          test('breakpoint should be ${expectedLayout.breakpoint}', () {
            expect(
              layout.breakpoint(expectedLayout.width),
              expectedLayout.breakpoint,
            );
          });
          test('format should be ${expectedLayout.format}', () {
            expect(format, expectedLayout.format);
          });
          test('body width should be ${expectedLayout.bodyWidth}', () {
            expect(
              format.bodyWidth(expectedLayout.width),
              expectedLayout.bodyWidth,
            );
          });
        });
      }
    });
  });

  group('smallestBreakpoint', () {
    // TODO: implementation
  });

  group('biggestBreakpoint', () {
    // TODO: implementation
  });

  group('breakpointById', () {
    // TODO: implementation
  });

  group('nextBreakpoint', () {
    // TODO: implementation
  });

  group('previousBreakpoint', () {
    // TODO: implementation
  });

  group('Layout equality', () {
    // TODO: implementation
  });

  group('Breakpoint comparison', () {
    // TODO: implementation
  });
}
