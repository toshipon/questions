'use strict';

describe('Form', function () {
  var Form, component;

  beforeEach(function () {
    Form = require('../../../src/scripts/components/admin/Form.jsx');
    component = Form();
  });

  it('should create a new instance of Form', function () {
    expect(component).toBeDefined();
  });
});
