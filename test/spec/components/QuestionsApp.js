'use strict';

describe('Main', function () {
  var QuestionsApp, component;

  beforeEach(function () {
    var container = document.createElement('div');
    container.id = 'content';
    document.body.appendChild(container);

    QuestionsApp = require('../../../src/scripts/components/QuestionsApp.jsx');
    component = QuestionsApp();
  });

  it('should create a new instance of QuestionsApp', function () {
    expect(component).toBeDefined();
  });
});
