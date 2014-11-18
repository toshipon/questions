'use strict';

describe('List', function () {
  var List, component;

  beforeEach(function () {
    List = require('../../../src/scripts/components/admin/List.jsx');
    component = List();
  });

  it('should create a new instance of List', function () {
    expect(component).toBeDefined();
  });
});
