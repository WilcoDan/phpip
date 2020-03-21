<form id="createClassForm">
  <fieldset>
    <legend>New class</legend>
    <table class="table table-sm">
      <tr>
        <td><label for="name" title="{{ $tableComments['name'] }} "><b>Name</b></label></td>
        <td >
          <input type="text" class="form-control form-control-sm" name="name">
        </td>
        <td><label for="description" title="{{ $tableComments['description'] }}">Description</label></td>
        <td><input id="description" class="form-control form-control-sm" name="description"></td>
      </tr>
      <tr>
        <td><label for="category_new" title="{{ $tableComments['category_id'] }}">Category</label></td>
        <td>
          <input type='hidden' name='category_id'>
          <input type="text" class="form-control form-control-sm" data-ac="/template-category/autocomplete" data-actarget="category_id" autocomplete="off">
        </td>
        <td><label title="{{ $tableComments['default_role'] }}">Deafult role</label></td>
        <td>
          <input type='hidden' name='default_role'>
          <input type="text" class="form-control form-control-sm" data-ac="/role/autocomplete" data-actarget="default_role" autocomplete="off">
        </td>
      </tr>
    </table>
  </fieldset>

  <button type="button" class="btn btn-danger" id="createClassSubmit" data-redirect="/documents">Create class</button><br>
</form>
