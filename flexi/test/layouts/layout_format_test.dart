import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../index.dart';

void main() {
  const format = LayoutFormat(
    columns: 4,
    gutter: 10,
    leftMargin: 10,
    topMargin: 20,
    rightMargin: 30,
    bottomMargin: 40,
    module: LayoutModule(baseline: 20, rows: 2, gutter: 10),
  );

  group('Given $format', () {
    const expectedMargins = EdgeInsets.fromLTRB(10, 20, 30, 40);
    test('Margins should be $expectedMargins', () {
      expect(format.margins, expectedMargins);
    });

    group('Body width', () {
      const expectedBodyWidths = <int, double>{
        0: 0,
        10: 0,
        40: 0,
        41: 1,
        50: 10,
      };
      for (final expectedEntry in expectedBodyWidths.entries) {
        final containerWidth = expectedEntry.key;
        final expectedBodyWidth = expectedEntry.value;
        group('Given container width $containerWidth', () {
          test('Body width should be $expectedBodyWidth', () {
            expect(
              format.bodyWidth(containerWidth.toDouble()),
              expectedBodyWidth,
            );
          });
        });
      }
    });

    group('Body height', () {
      const expectedBodyHeights = <int, double>{
        0: 0,
        10: 0,
        60: 0,
        61: 1,
        70: 10,
      };
      for (final expectEntry in expectedBodyHeights.entries) {
        final containerHeight = expectEntry.key;
        final expectedBodyHeight = expectEntry.value;
        group('Given container height $containerHeight', () {
          test('Body height should be $expectedBodyHeight', () {
            expect(
              format.bodyHeight(containerHeight.toDouble()),
              expectedBodyHeight,
            );
          });
        });
      }
    });

    group('Body size', () {
      const containerSize = Size(50, 70);
      const expectedBodySize = Size(10, 10);
      group('Given container size $containerSize', () {
        test('Body size should be $expectedBodySize', () {
          expect(
            format.bodySize(containerSize),
            expectedBodySize,
          );
        });
      });
    });

    group('Column width', () {
      const expectedColumnWidths = <int, double>{
        0: 0,
        10: 0,
        50: 0,
        70: 0,
        71: 0.25,
        78: 2,
      };
      for (final expectEntry in expectedColumnWidths.entries) {
        final containerWidth = expectEntry.key;
        final expectedColumnWidth = expectEntry.value;
        group('Given container width $containerWidth', () {
          test('Column width should be $expectedColumnWidth', () {
            expect(
              format.columnWidth(containerWidth.toDouble()),
              expectedColumnWidth,
            );
          });
        });
      }
    });

    group('Region width', () {
      const containerWidth = 78.0;
      group('Given container width $containerWidth', () {
        final expectedRegionWidths = <int, double>{
          0: 0,
          1: 2,
          2: 14,
          3: 26,
        };
        for (final expectedEntry in expectedRegionWidths.entries) {
          final columns = expectedEntry.key;
          final expectedRegionWidth = expectedEntry.value;
          test(
              'Region width of $columns columns should be $expectedRegionWidth',
              () {
            expect(
              format.regionWidth(columns, containerWidth),
              expectedRegionWidth,
            );
          });
        }
      });
    });

    group('Region height', () {
      const expectedRegionHeights = <int, double>{
        0: 0,
        1: 40,
        2: 90,
      };
      for (final expectEntry in expectedRegionHeights.entries) {
        final modules = expectEntry.key;
        final expectedRegionHeight = expectEntry.value;
        test(
            'Region height of $modules modules should be $expectedRegionHeight',
            () {
          expect(
            format.regionHeight(modules),
            expectedRegionHeight,
          );
        });
      }
    });

    group('Region space width', () {
      const containerWidth = 78.0;
      group('Given container width $containerWidth', () {
        final expectedRegionSpaceWidths = <int, double>{
          0: 10,
          1: 22,
          2: 34,
          3: 46,
        };
        for (final expectedEntry in expectedRegionSpaceWidths.entries) {
          final columns = expectedEntry.key;
          final expectedRegionSpaceWidth = expectedEntry.value;
          test(
              'Region space width of $columns columns'
              ' should be $expectedRegionSpaceWidth', () {
            expect(
              format.regionSpaceWidth(columns, containerWidth),
              expectedRegionSpaceWidth,
            );
          });
        }
      });
    });

    group('Region space height', () {
      const expectedRegionSpaceHeights = <int, double>{
        0: 10,
        1: 60,
        2: 110,
      };
      for (final expectEntry in expectedRegionSpaceHeights.entries) {
        final modules = expectEntry.key;
        final expectedRegionSpaceHeight = expectEntry.value;
        test(
            'Region space height of $modules modules'
            ' should be $expectedRegionSpaceHeight', () {
          expect(
            format.regionSpaceHeight(modules),
            expectedRegionSpaceHeight,
          );
        });
      }
    });
  });

  group('LayoutFormat copy', () {
    // TODO(xuan): implementation
  });

  group('LayoutFormat equality', () {
    // TODO(xuan): implementation
  });

  group('LayoutModule equality', () {
    // TODO(xuan): implementation
  });
}
