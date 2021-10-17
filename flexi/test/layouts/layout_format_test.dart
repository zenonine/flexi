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
      for (var expectedEntry in expectedBodyWidths.entries) {
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
      for (var expectEntry in expectedBodyHeights.entries) {
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

    group('Column width', () {
      const expectedColumnWidths = <int, double>{
        0: 0,
        10: 0,
        70: 0,
        71: 0.25,
        78: 2,
      };
      for (var expectEntry in expectedColumnWidths.entries) {
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
        const expectedColumnWidth = 2.0;
        final expectedRegionWidths = <int, double>{
          0: 0,
          1: 0 * format.module.gutter + 1 * expectedColumnWidth,
          2: 1 * format.module.gutter + 2 * expectedColumnWidth,
          3: 2 * format.module.gutter + 3 * expectedColumnWidth,
        };
        for (var expectedEntry in expectedRegionWidths.entries) {
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
      for (var expectEntry in expectedRegionHeights.entries) {
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
  });

  group('LayoutFormat copy', () {
    // TODO: implementation
  });

  group('LayoutFormat equality', () {
    // TODO: implementation
  });

  group('LayoutModule equality', () {
    // TODO: implementation
  });
}
