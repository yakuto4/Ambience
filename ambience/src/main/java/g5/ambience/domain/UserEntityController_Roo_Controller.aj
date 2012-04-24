// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package g5.ambience.domain;

import g5.ambience.domain.BundleEntity;
import g5.ambience.domain.UserEntity;
import g5.ambience.domain.UserEntityController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UserEntityController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UserEntityController.create(@Valid UserEntity userEntity, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userEntity);
            return "userentitys/create";
        }
        uiModel.asMap().clear();
        userEntity.persist();
        return "redirect:/userentitys/" + encodeUrlPathSegment(userEntity.getUsername().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UserEntityController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UserEntity());
        return "userentitys/create";
    }
    
    @RequestMapping(value = "/{username}", produces = "text/html")
    public String UserEntityController.show(@PathVariable("username") String username, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("userentity", UserEntity.findUserEntity(username));
        uiModel.addAttribute("itemId", username);
        return "userentitys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UserEntityController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("userentitys", UserEntity.findUserEntityEntries(firstResult, sizeNo));
            float nrOfPages = (float) UserEntity.countUserEntitys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("userentitys", UserEntity.findAllUserEntitys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "userentitys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UserEntityController.update(@Valid UserEntity userEntity, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userEntity);
            return "userentitys/update";
        }
        uiModel.asMap().clear();
        userEntity.merge();
        return "redirect:/userentitys/" + encodeUrlPathSegment(userEntity.getUsername().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{username}", params = "form", produces = "text/html")
    public String UserEntityController.updateForm(@PathVariable("username") String username, Model uiModel) {
        populateEditForm(uiModel, UserEntity.findUserEntity(username));
        return "userentitys/update";
    }
    
    @RequestMapping(value = "/{username}", method = RequestMethod.DELETE, produces = "text/html")
    public String UserEntityController.delete(@PathVariable("username") String username, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserEntity userEntity = UserEntity.findUserEntity(username);
        userEntity.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/userentitys";
    }
    
    void UserEntityController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("userEntity_dob_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("userEntity_ccexpiration_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void UserEntityController.populateEditForm(Model uiModel, UserEntity userEntity) {
        uiModel.addAttribute("userEntity", userEntity);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("bundleentitys", BundleEntity.findAllBundleEntitys());
    }
    
    String UserEntityController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
